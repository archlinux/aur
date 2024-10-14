modname := hid-ft260
obj-m := $(modname).o

KVERSION := $(shell uname -r)
KDIR := /lib/modules/$(KVERSION)/build
PWD := "$$(pwd)"

ifdef DEBUG
CFLAGS_$(obj-m) := -DDEBUG
endif

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) O=$(PWD) -C $(KDIR) M=$(PWD) clean

load:
	-rmmod $(modname)
	insmod $(modname).ko

install:
	install -m 0755 -o root -g root $(modname).ko /lib/modules/$(KVERSION)/updates/drivers/hid/$(modname)
	depmod -a

uninstall:
	rm /lib/modules/$(KVERSION)/updates/drivers/hid/$(modname)/$(modname).ko
	rmdir /lib/modules/$(KVERSION)/updates/drivers/hid/$(modname)
	rmdir /lib/modules/$(KVERSION)/updates/drivers/hid
	depmod -a
