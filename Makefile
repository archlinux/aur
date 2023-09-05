# Makefile for Dektec drivers version @PKGVER@ DKMS.

default:
	$(MAKE) -C Drivers/Dta/Source/Linux
	$(MAKE) -C Drivers/DtaNw/Source/Linux
	$(MAKE) -C Drivers/Dtu/Source/Linux
	$(MAKE) -C Drivers/DtPcie/Source/Linux
	$(MAKE) -C Drivers/DtPcieNw/Source/Linux

clean:
	find . \( -name '.*.o.cmd' -o -name '.*.ko.cmd' -o -name '*.mod.c' -o -name '*.o' -o -name '.*.d' -o -name '*.ko' -o -name '.tmp_versions' -o -name 'modules.order' -o -name 'Module.symvers' \) -print0 | xargs -0 rm -rf
