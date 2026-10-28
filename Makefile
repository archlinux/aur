# Generic Makefile for MediaTek MT7927 DKMS package

VERSION        ?= $(shell sed -n 's/^PACKAGE_VERSION="\(.*\)"/\1/p' $(dir $(abspath $(lastword $(MAKEFILE_LIST))))dkms.conf)
PKGBUILD_VER   ?= $(shell sed -n "s/^pkgver=\(.*\)/\1/p" $(dir $(abspath $(lastword $(MAKEFILE_LIST))))PKGBUILD)
MT76_KVER      ?= $(shell sed -n "s/^_mt76_kver='\(.*\)'/\1/p" $(dir $(abspath $(lastword $(MAKEFILE_LIST))))PKGBUILD)
KERNEL_TARBALL ?= linux-$(MT76_KVER).tar.xz
DRIVER_ZIP     ?= $(firstword $(wildcard DRV_WiFi_MTK_MT7925_MT7927*.zip))
SRCDIR         ?= _build
DESTDIR        ?=
DKMS_PREFIX    ?= /usr/src/mediatek-mt7927-$(VERSION)
FIRMWARE_PREFIX?= /usr/lib/firmware/mediatek
PYTHON         ?= python3
BUILD_WIFI     ?= yes
PREPARE_FIRMWARE ?= yes
DKMS_AUTOINSTALL ?= yes
BT_MODULE_VERSION ?=
DKMS_KERNEL_PATTERN ?=

TOPDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
STAMP  := $(SRCDIR)/.sources-$(BUILD_WIFI)-$(PREPARE_FIRMWARE)-$(BT_MODULE_VERSION)-done

.PHONY: download sources install clean rpm deb check-version build-bluetooth

# ── download ────────────────────────────────────────────────────────
download:
	@if [ ! -f "$(KERNEL_TARBALL)" ]; then \
		echo "Downloading linux-$(MT76_KVER).tar.xz..."; \
		curl -L -f -o "$(KERNEL_TARBALL)" \
			"https://cdn.kernel.org/pub/linux/kernel/v$(firstword $(subst ., ,$(MT76_KVER))).x/linux-$(MT76_KVER).tar.xz"; \
	else \
		echo "Kernel tarball already exists: $(KERNEL_TARBALL)"; \
	fi
ifeq ($(PREPARE_FIRMWARE),yes)
	@$(TOPDIR)download-driver.sh .
endif

# ── version check ────────────────────────────────────────────────────
check-version:
	@if [ -f "$(TOPDIR)PKGBUILD" ] && [ "$(VERSION)" != "$(PKGBUILD_VER)" ]; then \
		echo >&2 "ERROR: Version mismatch: dkms.conf=$(VERSION) PKGBUILD=$(PKGBUILD_VER)"; \
		echo >&2 "Run makepkg or update PACKAGE_VERSION in dkms.conf"; \
		exit 1; \
	fi

# ── sources ─────────────────────────────────────────────────────────
sources: $(STAMP)

$(STAMP): check-version
	@if [ ! -f "$(KERNEL_TARBALL)" ]; then \
		echo >&2 "ERROR: Kernel tarball not found: $(KERNEL_TARBALL)"; \
		echo >&2 "Run 'make download' first or set KERNEL_TARBALL=path/to/linux-$(MT76_KVER).tar.xz"; \
		exit 1; \
	fi
ifeq ($(PREPARE_FIRMWARE),yes)
	@if [ -z "$(DRIVER_ZIP)" ]; then \
		echo >&2 "ERROR: No driver ZIP found. Set DRIVER_ZIP= or run 'make download' first."; \
		exit 1; \
	fi
	@if [ ! -f "$(DRIVER_ZIP)" ]; then \
		echo >&2 "ERROR: Driver ZIP not found: $(DRIVER_ZIP)"; \
		exit 1; \
	fi
	@echo "==> Extracting firmware from driver ZIP..."
	mkdir -p "$(SRCDIR)/firmware"
	$(PYTHON) "$(TOPDIR)extract_firmware.py" "$(DRIVER_ZIP)" "$(SRCDIR)/firmware" $(if $(filter no,$(BUILD_WIFI)),--bluetooth-only,)
endif
ifeq ($(BUILD_WIFI),yes)
	@echo "==> Extracting mt76 source from kernel v$(MT76_KVER) tarball..."
	mkdir -p "$(SRCDIR)/mt76"
	tar -xf "$(KERNEL_TARBALL)" \
		--strip-components=6 \
		-C "$(SRCDIR)/mt76" \
		"linux-$(MT76_KVER)/drivers/net/wireless/mediatek/mt76"
endif
	@echo "==> Extracting bluetooth source..."
	mkdir -p "$(SRCDIR)/bluetooth"
	tar -xf "$(KERNEL_TARBALL)" \
		--strip-components=3 \
		-C "$(SRCDIR)/bluetooth" \
		"linux-$(MT76_KVER)/drivers/bluetooth"
ifeq ($(BUILD_WIFI),yes)
	@echo "==> Applying MT7927 WiFi patches..."
	@for p in $(TOPDIR)mt7927-wifi-*.patch; do \
		echo "  $$(basename "$$p")"; \
		patch -d "$(SRCDIR)/mt76" -p1 < "$$p" || exit 1; \
	done
endif
	@echo "==> Applying MT6639 Bluetooth patches..."
	@for p in $(TOPDIR)mt6639-bt-[0-9]*.patch $(TOPDIR)mt6639-bt-compat-*.patch; do \
		echo "  $$(basename "$$p")"; \
		patch -d "$(SRCDIR)/bluetooth" -p1 < "$$p" || exit 1; \
	done
	cp "$(TOPDIR)bluetooth.Makefile" "$(SRCDIR)/bluetooth/Makefile"
	@rm -f "$(SRCDIR)/bluetooth/bt-local-version.h"
ifneq ($(BT_MODULE_VERSION),)
	@printf '%s\n' '$(BT_MODULE_VERSION)' | LC_ALL=C grep -Eq '^[0-9]+(\.[0-9]+)*$$' || { echo >&2 "BT_MODULE_VERSION must be a numeric dotted version"; exit 1; }
	@printf '#define BT_BACKPORT_VERSION "%s"\n' '$(BT_MODULE_VERSION)' > "$(SRCDIR)/bluetooth/bt-local-version.h"
endif
ifeq ($(BUILD_WIFI),yes)
	@echo "==> Installing Kbuild files..."
	cp "$(TOPDIR)mt76.Kbuild"      "$(SRCDIR)/mt76/Kbuild"
	cp "$(TOPDIR)mt7921.Kbuild"    "$(SRCDIR)/mt76/mt7921/Kbuild"
	cp "$(TOPDIR)mt7925.Kbuild"    "$(SRCDIR)/mt76/mt7925/Kbuild"
	@echo "==> Installing compat headers..."
	mkdir -p "$(SRCDIR)/mt76/compat/include/linux/soc/airoha"
	cp "$(TOPDIR)compat-airoha-offload.h" \
		"$(SRCDIR)/mt76/compat/include/linux/soc/airoha/airoha_offload.h"
endif
	@echo "==> Sources ready in $(SRCDIR)/"
	@touch "$(STAMP)"

# Explicit target ABI: never substitute the running kernel for a DKMS target.
build-bluetooth: sources
	@test -n "$(TARGET_KERNEL)" || { echo >&2 "Set TARGET_KERNEL (for example 6.8.0-138-generic)"; exit 1; }
	$(MAKE) -C "/lib/modules/$(TARGET_KERNEL)/build" M="$(abspath $(SRCDIR))/bluetooth" modules

# ── install ─────────────────────────────────────────────────────────
install: sources
	@echo "==> Installing DKMS source tree to $(DESTDIR)$(DKMS_PREFIX)..."
	install -dm755 "$(DESTDIR)$(DKMS_PREFIX)"
	sed -e "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$(VERSION)\"/" \
		-e 's/^AUTOINSTALL=.*/AUTOINSTALL="$(DKMS_AUTOINSTALL)"/' \
		"$(TOPDIR)dkms.conf" > "$(DESTDIR)$(DKMS_PREFIX)/dkms.conf"
	# Preserve the selected module set in the staged DKMS package.
	sed -i '1i BUILD_WIFI=$(BUILD_WIFI)' "$(DESTDIR)$(DKMS_PREFIX)/dkms.conf"
ifneq ($(DKMS_KERNEL_PATTERN),)
	@printf 'BUILD_EXCLUSIVE_KERNEL="%s"\n' '$(DKMS_KERNEL_PATTERN)' >> "$(DESTDIR)$(DKMS_PREFIX)/dkms.conf"
endif
	chmod 644 "$(DESTDIR)$(DKMS_PREFIX)/dkms.conf"
	install -Dm755 "$(TOPDIR)extract_firmware.py" "$(DESTDIR)$(DKMS_PREFIX)/extract_firmware.py"
	install -Dm755 "$(TOPDIR)dkms-post-remove.sh" "$(DESTDIR)$(DKMS_PREFIX)/dkms-post-remove.sh"
	install -Dm755 "$(TOPDIR)check-wifi-firmware.sh" "$(DESTDIR)$(DKMS_PREFIX)/check-wifi-firmware.sh"
	# Bluetooth source for DKMS btusb builds
	install -dm755 "$(DESTDIR)$(DKMS_PREFIX)/drivers/bluetooth"
	install -m644 $(SRCDIR)/bluetooth/btusb.c  "$(DESTDIR)$(DKMS_PREFIX)/drivers/bluetooth/"
	install -m644 $(SRCDIR)/bluetooth/btmtk.c  "$(DESTDIR)$(DKMS_PREFIX)/drivers/bluetooth/"
	install -m644 $(SRCDIR)/bluetooth/btmtk.h  "$(DESTDIR)$(DKMS_PREFIX)/drivers/bluetooth/"
	install -m644 $(SRCDIR)/bluetooth/btbcm.c  "$(DESTDIR)$(DKMS_PREFIX)/drivers/bluetooth/"
	install -m644 $(SRCDIR)/bluetooth/btbcm.h  "$(DESTDIR)$(DKMS_PREFIX)/drivers/bluetooth/"
	install -m644 $(SRCDIR)/bluetooth/btintel.h "$(DESTDIR)$(DKMS_PREFIX)/drivers/bluetooth/"
	install -m644 $(SRCDIR)/bluetooth/btrtl.h  "$(DESTDIR)$(DKMS_PREFIX)/drivers/bluetooth/"
	install -m644 $(SRCDIR)/bluetooth/Makefile "$(DESTDIR)$(DKMS_PREFIX)/drivers/bluetooth/"
	@if [ -f "$(SRCDIR)/bluetooth/bt-local-version.h" ]; then \
		install -m644 "$(SRCDIR)/bluetooth/bt-local-version.h" "$(DESTDIR)$(DKMS_PREFIX)/drivers/bluetooth/"; \
	fi
ifeq ($(BUILD_WIFI),yes)
	# Patched mt76 WiFi source tree
	install -dm755 "$(DESTDIR)$(DKMS_PREFIX)/mt76/mt7921" \
		"$(DESTDIR)$(DKMS_PREFIX)/mt76/mt7925"
	install -m644 $(SRCDIR)/mt76/*.c $(SRCDIR)/mt76/*.h \
		"$(DESTDIR)$(DKMS_PREFIX)/mt76/"
	install -m644 $(SRCDIR)/mt76/Kbuild "$(DESTDIR)$(DKMS_PREFIX)/mt76/"
	# Compat headers for kernels < 6.19 (airoha_offload.h stub)
	install -dm755 "$(DESTDIR)$(DKMS_PREFIX)/mt76/compat/include/linux/soc/airoha"
	install -m644 $(SRCDIR)/mt76/compat/include/linux/soc/airoha/airoha_offload.h \
		"$(DESTDIR)$(DKMS_PREFIX)/mt76/compat/include/linux/soc/airoha/"
	install -m644 $(SRCDIR)/mt76/mt7921/*.c $(SRCDIR)/mt76/mt7921/*.h \
		"$(DESTDIR)$(DKMS_PREFIX)/mt76/mt7921/"
	install -m644 $(SRCDIR)/mt76/mt7921/Kbuild "$(DESTDIR)$(DKMS_PREFIX)/mt76/mt7921/"
	install -m644 $(SRCDIR)/mt76/mt7925/*.c $(SRCDIR)/mt76/mt7925/*.h \
		"$(DESTDIR)$(DKMS_PREFIX)/mt76/mt7925/"
	install -m644 $(SRCDIR)/mt76/mt7925/Kbuild "$(DESTDIR)$(DKMS_PREFIX)/mt76/mt7925/"
endif
	# BT firmware. This one is ours to ship: linux-firmware takes vendor blobs
	# from the copyright holder, so MR !946 was closed and MT6639 BT firmware
	# has to come from MediaTek before it can live there.
ifeq ($(PREPARE_FIRMWARE),yes)
	install -Dm644 "$(SRCDIR)/firmware/BT_RAM_CODE_MT6639_2_1_hdr.bin" \
		"$(DESTDIR)$(FIRMWARE_PREFIX)/mt7927/BT_RAM_CODE_MT6639_2_1_hdr.bin"
endif
	# WiFi firmware is deliberately NOT installed. MediaTek's own build is in
	# linux-firmware (MR !1055) as a .zst, and the loader tries the bare name
	# before the compressed one, so installing ours here shadowed a newer
	# vendor blob with one extracted from a Windows driver ZIP. extract_firmware.py
	# still pulls the WiFi blobs out for anyone whose linux-firmware predates
	# !1055; see the firmware section in README.md.
	# Patch files (reference copies)
	install -dm755 "$(DESTDIR)$(DKMS_PREFIX)/patches/bt"
	install -dm755 "$(DESTDIR)$(DKMS_PREFIX)/patches/wifi"
	install -m644 $(TOPDIR)mt6639-bt-[0-9]*.patch $(TOPDIR)mt6639-bt-compat-*.patch "$(DESTDIR)$(DKMS_PREFIX)/patches/bt/"
ifeq ($(BUILD_WIFI),yes)
	install -m644 $(TOPDIR)mt7927-wifi-*.patch "$(DESTDIR)$(DKMS_PREFIX)/patches/wifi/"
endif
	@echo "==> Install complete."
ifeq ($(BUILD_WIFI),yes)
	@# A packager staging into DESTDIR runs the check from the package scriptlet.
	@if [ -z "$(DESTDIR)" ]; then "$(TOPDIR)check-wifi-firmware.sh"; fi
endif

# ── rpm ─────────────────────────────────────────────────────────────
rpm:
	"$(TOPDIR)build-rpm.sh"

# ── deb ─────────────────────────────────────────────────────────────
deb:
	"$(TOPDIR)build-deb.sh"

# ── clean ───────────────────────────────────────────────────────────
clean:
	rm -rf "$(SRCDIR)" rpmbuild/
