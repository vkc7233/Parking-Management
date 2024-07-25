DELIMITER $$
CREATE OR REPLACE TRIGGER `calculate_bill` BEFORE
UPDATE ON `TOKEN` FOR EACH ROW BEGIN IF NEW.EXIT_TIME IS NOT NULL THEN
SET
  NEW.BILL_AMOUNT = 20 + (
    TIMESTAMPDIFF(MINUTE, NEW.ENTRY_TIME, NEW.EXIT_TIME) / 60
  ) * 5;
END IF;
END;
$$
