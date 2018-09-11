KVERSION ?= $(shell uname -r)

SRC_URL = https://raw.githubusercontent.com/raspberrypi/linux/rpi-$(shell echo $(KVERSION) | grep -Po '\d\.\d+').y/drivers/media/i2c

obj-m += tc358743.o

all: tc358743_regs.h tc358743.c
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
	rm *.c *.h

tc358743_regs.h:
	wget $(SRC_URL)/tc358743_regs.h

tc358743.c:
	wget $(SRC_URL)/tc358743.c
