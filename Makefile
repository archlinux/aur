# SPDX-License-Identifier: GPL-2.0-only
KDIR ?= /lib/modules/$(shell uname -r)/build

obj-m += mt7601u.o

mt7601u-objs	= \
	usb.o init.o main.o mcu.o trace.o dma.o core.o eeprom.o phy.o \
	mac.o util.o debugfs.o tx.o

CFLAGS_trace.o := -I$(src)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
