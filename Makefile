obj-m := atusb.o

KRELEASE := $(shell uname -r)
KDIR := /usr/lib/modules/$(KRELEASE)/build
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
