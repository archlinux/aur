obj-m := i2c-piix4.o

ifndef KERNELRELEASE
KRELEASE := $(shell uname -r)
else
KRELEASE := $(KERNELRELEASE)
endif

KDIR := /usr/lib/modules/$(KRELEASE)/build
PWD := $(shell pwd)


default:

	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
