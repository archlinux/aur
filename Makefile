ifeq ($(KERNELRELEASE),)
KERNELRELEASE=$(shell uname -r)
endif

obj-m := frandom.o

KDIR := /lib/modules/$(KERNELRELEASE)/build
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
