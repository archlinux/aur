# SPDX-License-Identifier: GPL-2.0
#
# Top-level Kbuild for the AppleTalk module only, cut down from
# mod-orphan's Kbuild. The local include/ provides <linux/atalk.h>, which
# the kernel tree no longer ships; <uapi/linux/atalk.h> still comes from
# the kernel headers.

LINUXINCLUDE := -I$(src)/include $(LINUXINCLUDE)

obj-m += net/appletalk/
