# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the KernelSU DKMS module support.
#

export CONFIG_KSU := m

KDIR ?= /lib/modules/$(KVERSION)/build

all:
	make -C $(KDIR) M=$(PWD) modules

clean:
	make -C $(KDIR) M=$(PWD) clean