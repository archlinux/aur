ifneq (${KERNELRELEASE},)
ccflags-y := -I$(src)/include -DWINESYNC_MINOR=243
obj-m += src/drivers/misc/winesync.o
else
KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
endif
