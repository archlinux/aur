ifndef KERNELRELEASE
KRELEASE := $(shell uname -r)
else
KRELEASE := $(KERNELRELEASE)
endif

KDIR := /usr/lib/modules/$(KRELEASE)/build
PWD := $(shell pwd)
SRCDIR := $(PWD)/hda-src
MODULENAME := snd-hda-intel.ko

default:
	$(Q)cd $(SRCDIR)
	$(MAKE) -j 1 -C $(KDIR) M=$(SRCDIR) modules
	$(Q)cp $(SRCDIR)/$(MODULENAME) $(PWD)
clean:
	$(MAKE) -C $(KDIR) M=$(SRCDIR) clean
	$(Q)rm $(PWD)/$(MODULENAME)
