KERNELRELEASE ?= $(shell uname -r)
KDIR ?= /lib/modules/$(KERNELRELEASE)/build
PWD ?= $(shell pwd)

obj-m := drivers/misc/ntsync.o
ccflags-y := -I$(src)/include -Werror

default: modules
install: modules_install

modules modules_install clean:
	$(MAKE) -C $(KDIR) M=$(PWD) $@
