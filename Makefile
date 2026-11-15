# Separate Kbuild keeps DKMS's KERNELRELEASE from bypassing this wrapper.
.DEFAULT_GOAL := all
KVER ?= $(shell uname -r)
KDIR ?= /usr/lib/modules/$(KVER)/build

# Only exact reviewed releases have a source. Never fall back to an older driver.
XPAD_SOURCE_7.3.3-1-cachyos := sources/xpad-linux-7.3.3.c
XPAD_SOURCE_7.3.4-1-cachyos := sources/xpad-linux-7.3.4.c
# Signed Arch/zen release trees have the identical xpad blob; see SOURCES.md.
XPAD_SOURCE_7.3.4-arch1-2 := sources/xpad-linux-7.3.4.c
XPAD_SOURCE_7.3.4-zen2-2-zen := sources/xpad-linux-7.3.4.c
XPAD_SOURCE_6.18.60-2-cachyos-lts := sources/xpad-linux-6.18.60.c
XPAD_SOURCE := $(XPAD_SOURCE_$(KVER))
ifeq ($(XPAD_SOURCE),)
$(error Unsupported target $(KVER); no reviewed matching xpad source)
endif
ifneq ($(shell cat "$(KDIR)/include/config/kernel.release" 2>/dev/null),$(KVER))
$(error Target headers do not match KVER=$(KVER))
endif

# Some DKMS versions append LLVM=1; retain an explicit escape hatch.
ifneq ($(origin XPAD_LLVM),undefined)
override LLVM := $(XPAD_LLVM)
endif
ifeq ($(origin LLVM),undefined)
ifeq ($(shell grep -cx 'CONFIG_CC_IS_CLANG=y' "$(KDIR)/.config" 2>/dev/null),1)
LLVM := 1
else ifeq ($(shell grep -cx 'CONFIG_CC_IS_GCC=y' "$(KDIR)/.config" 2>/dev/null),1)
LLVM :=
else
$(error Cannot identify target compiler in $(KDIR)/.config; provide valid headers or explicit LLVM)
endif
endif

.PHONY: all modules prepare-source clean
all modules: prepare-source
	$(MAKE) -C "$(KDIR)" M="$(CURDIR)" LLVM="$(LLVM)" modules

prepare-source:
	@test -f "$(XPAD_SOURCE)" || { echo "Missing reviewed source $(XPAD_SOURCE)" >&2; exit 1; }
	@cmp -s "$(XPAD_SOURCE)" xpad.c || cp -- "$(XPAD_SOURCE)" xpad.c

clean:
	$(MAKE) -C "$(KDIR)" M="$(CURDIR)" LLVM="$(LLVM)" clean
