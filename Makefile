# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the KernelSU DKMS module support.
#

export CONFIG_KSU := m
export CONFIG_KSU_X86_PATCH_SYSCALL_DISPATCHER := y
export CONFIG_KSU_NON_ANDROID := y
export CONFIG_KSU_SELINUX := n
export CONFIG_KSU_DEBUG := n

KDIR ?= /lib/modules/$(KVERSION)/build

all:
	make -C $(KDIR) M=$(PWD) modules

clean:
	make -C $(KDIR) M=$(PWD) clean
