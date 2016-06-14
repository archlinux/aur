modname := clevo-xsm-wmi
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
	mkdir -p /lib/modules/$(KVERSION)/misc/$(modname)
	install -m 0755 -o root -g root $(modname).ko /lib/modules/$(KVERSION)/kernel/drivers/input/keyboard/$(modname)
	depmod -a

uninstall:
	rm /lib/modules/$(KVERSION)/kernel/drivers/input/keyboard/$(modname)/$(modname).ko
	rmdir /lib/modules/$(KVERSION)/kernel/drivers/input/keyboard/$(modname)
	rmdir /lib/modules/$(KVERSION)/kernel/drivers/input/keyboard
	depmod -a

