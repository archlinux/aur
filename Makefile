VERSION         := 0.0.1
TARGET          := $(shell uname -r)

KERNEL_MODULES	:= /lib/modules/$(TARGET)

ifneq ("","$(wildcard /usr/src/linux-headers-$(TARGET)/*)")
# Ubuntu
KDIR	:= /usr/src/linux-headers-$(TARGET)
else
ifneq ("","$(wildcard /usr/src/kernels/$(TARGET)/*)")
# Fedora
KDIR	:= /usr/src/kernels/$(TARGET)
else
KDIR	:= $(KERNEL_MODULES)/build
endif
endif

SOURCES := msi-psu.c

obj-m	:= msi-psu.o
obj-ko	:= msi-psu.ko

.PHONY: all modules clean

all: modules

modules:
	@$(MAKE) -C $(KDIR) M=$(CURDIR) modules

checkpatch:
	$(KDIR)/scripts/checkpatch.pl --strict --no-tree $(SOURCES)

clean:
	@$(MAKE) -C $(KDIR) M=$(CURDIR) clean
