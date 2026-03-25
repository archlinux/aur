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

TOPDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
STAMP  := $(SRCDIR)/.sources-done

.PHONY: download sources install clean rpm deb check-version

# ── download ────────────────────────────────────────────────────────
download:
	@if [ ! -f "$(KERNEL_TARBALL)" ]; then \
		echo "Downloading linux-$(MT76_KVER).tar.xz..."; \
		curl -L -f -o "$(KERNEL_TARBALL)" \
			"https://cdn.kernel.org/pub/linux/kernel/v$(firstword $(subst ., ,$(MT76_KVER))).x/linux-$(MT76_KVER).tar.xz"; \
	else \
		echo "Kernel tarball already exists: $(KERNEL_TARBALL)"; \
	fi
	@$(TOPDIR)download-driver.sh .

# ── version check ────────────────────────────────────────────────────
check-version:
	@if [ "$(VERSION)" != "$(PKGBUILD_VER)" ]; then \
		echo >&2 "ERROR: Version mismatch: dkms.conf=$(VERSION) PKGBUILD=$(PKGBUILD_VER)"; \
		echo >&2 "Update PACKAGE_VERSION in dkms.conf or pkgver in PKGBUILD"; \
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
	$(PYTHON) "$(TOPDIR)extract_firmware.py" "$(DRIVER_ZIP)" "$(SRCDIR)/firmware"
	@echo "==> Extracting mt76 source from kernel v$(MT76_KVER) tarball..."
	mkdir -p "$(SRCDIR)/mt76"
	tar -xf "$(KERNEL_TARBALL)" \
		--strip-components=6 \
		-C "$(SRCDIR)/mt76" \
		"linux-$(MT76_KVER)/drivers/net/wireless/mediatek/mt76"
	@echo "==> Extracting bluetooth source..."
	mkdir -p "$(SRCDIR)/bluetooth"
	tar -xf "$(KERNEL_TARBALL)" \
		--strip-components=3 \
		-C "$(SRCDIR)/bluetooth" \
		"linux-$(MT76_KVER)/drivers/bluetooth"
	@echo "==> Applying mt7902-wifi-6.19.patch..."
	patch -d "$(SRCDIR)/mt76" -p1 < "$(TOPDIR)mt7902-wifi-6.19.patch"
	@echo "==> Applying MT7927 WiFi patches..."
	@for p in $(TOPDIR)mt7927-wifi-*.patch; do \
		echo "  $$(basename "$$p")"; \
		patch -d "$(SRCDIR)/mt76" -p1 < "$$p"; \
	done
	@echo "==> Applying MT6639 Bluetooth patch..."
	patch -d "$(SRCDIR)/bluetooth" -p3 < "$(TOPDIR)mt6639-bt-6.19.patch"
	cp "$(TOPDIR)bluetooth.Makefile" "$(SRCDIR)/bluetooth/Makefile"
	@echo "==> Installing Kbuild files..."
	cp "$(TOPDIR)mt76.Kbuild"      "$(SRCDIR)/mt76/Kbuild"
	cp "$(TOPDIR)mt7921.Kbuild"    "$(SRCDIR)/mt76/mt7921/Kbuild"
	cp "$(TOPDIR)mt7925.Kbuild"    "$(SRCDIR)/mt76/mt7925/Kbuild"
	@echo "==> Installing compat headers..."
	mkdir -p "$(SRCDIR)/mt76/compat/include/linux/soc/airoha"
	cp "$(TOPDIR)compat-airoha-offload.h" \
		"$(SRCDIR)/mt76/compat/include/linux/soc/airoha/airoha_offload.h"
	@echo "==> Sources ready in $(SRCDIR)/"
	@touch "$(STAMP)"

# ── install ─────────────────────────────────────────────────────────
install: sources
	@echo "==> Installing DKMS source tree to $(DESTDIR)$(DKMS_PREFIX)..."
	install -Dm644 "$(TOPDIR)dkms.conf"          "$(DESTDIR)$(DKMS_PREFIX)/dkms.conf"
	install -Dm755 "$(TOPDIR)extract_firmware.py" "$(DESTDIR)$(DKMS_PREFIX)/extract_firmware.py"
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
	# BT firmware
	install -Dm644 "$(SRCDIR)/firmware/BT_RAM_CODE_MT6639_2_1_hdr.bin" \
		"$(DESTDIR)$(FIRMWARE_PREFIX)/mt6639/BT_RAM_CODE_MT6639_2_1_hdr.bin"
	# WiFi firmware
	install -Dm644 "$(SRCDIR)/firmware/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin" \
		"$(DESTDIR)$(FIRMWARE_PREFIX)/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin"
	install -Dm644 "$(SRCDIR)/firmware/WIFI_RAM_CODE_MT6639_2_1.bin" \
		"$(DESTDIR)$(FIRMWARE_PREFIX)/mt7927/WIFI_RAM_CODE_MT6639_2_1.bin"
	# Patch files (reference copies)
	install -dm755 "$(DESTDIR)$(DKMS_PREFIX)/patches/bt"
	install -dm755 "$(DESTDIR)$(DKMS_PREFIX)/patches/wifi"
	install -m644 "$(TOPDIR)mt6639-bt-6.19.patch" "$(DESTDIR)$(DKMS_PREFIX)/patches/bt/"
	install -m644 "$(TOPDIR)mt7902-wifi-6.19.patch" "$(DESTDIR)$(DKMS_PREFIX)/patches/wifi/"
	install -m644 $(TOPDIR)mt7927-wifi-*.patch "$(DESTDIR)$(DKMS_PREFIX)/patches/wifi/"
	@echo "==> Install complete."

# ── rpm ─────────────────────────────────────────────────────────────
rpm:
	"$(TOPDIR)build-rpm.sh"

# ── deb ─────────────────────────────────────────────────────────────
deb:
	"$(TOPDIR)build-deb.sh"

# ── clean ───────────────────────────────────────────────────────────
clean:
	rm -rf "$(SRCDIR)" rpmbuild/
