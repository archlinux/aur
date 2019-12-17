obj-m	:= ia32_aout.o
KDIR	:= /usr/lib/modules/$(KVERSION)/build
PWD	:= $(shell pwd)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

.PHONY: clean

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

