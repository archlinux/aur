# SPDX-License-Identifier: GPL-2.0
#
# Out-of-tree build for the AppleTalk module.
#
#   make                    # build against the running kernel
#   make KDIR=/path/to/src  # build against a specific kernel tree

KDIR ?= /lib/modules/$(shell uname -r)/build

all:
	$(MAKE) -C $(KDIR) M=$(CURDIR) modules

clean:
	$(MAKE) -C $(KDIR) M=$(CURDIR) clean

.PHONY: all clean
