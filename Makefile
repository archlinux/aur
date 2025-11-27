obj-m			+= cp210x.o


SUBARCH := $(shell uname -m | sed -e 's/i.86/i386/;s/armv7l/arm/;s/aarch64/arm64/;s/riscv64/riscv/')
ARCH ?= $(SUBARCH)
CROSS_COMPILE ?=
KVER  := $(shell uname -r)
KBASE := $(firstword $(subst -, ,$(KVER)))
KSRC := /lib/modules/$(KVER)/build
MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/usb/serial/

cp210x-objs := cp210x_overclock_v${KBASE}.o

all: modules

cp210x_v${KBASE}.c:
	curl -s -o cp210x_v${KBASE}.c https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/usb/serial/cp210x.c?h=v${KBASE}
cp210x_overclock_v${KBASE}.c: cp210x_v${KBASE}.c
	patch -o cp210x_overclock_v${KBASE}.c cp210x_v${KBASE}.c ./0001-extend-the-highest-baudrate-of-cp2102-to-be-1.5-MHz.patch

modules: cp210x_overclock_v${KBASE}.c
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd) modules

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
	rm -f *.ko *.mod *.mod.c *.o modules.order Module.symvers cp210x_v*.c
