KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD

%:
	$(MAKE) -C $(KDIR) M=$$PWD $@
