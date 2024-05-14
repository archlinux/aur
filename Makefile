obj-m			+= cp210x.o

SUBARCH := $(shell uname -m | sed -e 's/i.86/i386/;s/armv7l/arm/;s/aarch64/arm64/;s/riscv64/riscv/')
ARCH ?= $(SUBARCH)
CROSS_COMPILE ?=
KVER  := $(shell uname -r)
KSRC := /lib/modules/$(KVER)/build
MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/usb/serial/

all: modules


modules:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd)  modules

strip:
	$(CROSS_COMPILE)strip $(MODULE_NAME).ko --strip-unneeded

install:
	install -p -m 644 $(MODULE_NAME).ko  $(MODDESTDIR)
	/sbin/depmod -a ${KVER}

uninstall:
	rm -f $(MODDESTDIR)/$(MODULE_NAME).ko
	/sbin/depmod -a ${KVER}


.PHONY: modules clean

clean:
	rm -f *.ko *.mod *.mod.c *.o modules.order Module.symvers
