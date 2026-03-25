# Maintainer: floss@jetm.me
#
# DKMS package for MediaTek MT7927 / MT6639 combo chip (Filogic 380):
#   - Bluetooth (MT6639 via USB): WORKING - patches btusb with MT6639 device ID
#     and installs firmware extracted from the MediaTek driver package.
#   - WiFi (MT7925e via PCIe): WORKING - patches mt7925e driver with MT7927
#     CBTOP remap, DMA ring layout, DBDC dual-band, and CNM channel context.
#     2.4/5/6 GHz tested, 320MHz EHT, suspend/resume.
#
# Sources mt76 + btusb from the kernel tarball (cdn.kernel.org) to avoid
# kernel.org CGI rate limits (503 errors after ~50 requests).
# Tracking:
#       https://github.com/openwrt/mt76/issues/927
#
# Known hardware using MT7927/MT6639:
#   - ASUS ROG Crosshair X870E Hero (BT USB 0489:e13a, WiFi PCI 14c3:7927)
#   - Lenovo Legion Pro 7 16ARX9      (BT USB 0489:e0fa, WiFi PCI 14c3:7927)
#   - Foxconn/Azurewave modules        (WiFi PCI 14c3:6639)
#   - AMD RZ738 (MediaTek MT7927)      (WiFi PCI 14c3:0738)
#   - ASUS ROG Zephyrus G14          (aftermarket MT7927 swap)
#   - TP-Link Archer TBE550E PCIe    (BT USB 0489:e116, E-key MT7927, extractable for laptop use)
#   - ASUS ProArt X870E              (WiFi PCI 14c3:7927)
#   - ASUS X870E-E                   (BT USB 13d3:3588, WiFi PCI 14c3:7927)
#   - Gigabyte Z790 AORUS MASTER X       (BT USB 0489:e10f, WiFi PCI 14c3:7927)
#   - Gigabyte Z790 AORUS ELITE X WiFi7  (BT USB 0489:e10f, WiFi PCI 14c3:7927)
#
# MediaTek naming is confusing. Here's the map:
#   MT7927 = combo module on the motherboard (WiFi 7 + BT 5.4, Filogic 380)
#     ├─ BT side:   internally MT6639, connects via USB (0489:e13a)
#     └─ WiFi side: architecturally MT7925, connects via PCIe (14c3:7927)
#   MT7925 = standalone WiFi 7 chip — same silicon as MT7927's WiFi half
#   MT7902 = separate WiFi 6E chip (different product line, uses mt7921 driver)
#
# MT7902 WiFi modules (mt7921e) are included because:
#   - The mt76 driver framework is shared: building mt7925e already requires the
#     mt76 core, mt76-connac-lib, and mt792x-lib modules.
#   - mt7921e (which serves MT7902) shares the exact same dependency chain.
#   - Including it costs nothing extra and helps users with MT7902 hardware who
#     need the WiFi 6E patches from lore.kernel.org (Sean Wang's series).
#
# The ASUS driver ZIP is automatically downloaded from the ASUS CDN.
# Alternatively, manually download from your board's ASUS support page:
#   https://rog.asus.com/motherboards/rog-crosshair/rog-crosshair-x870e-hero/helpdesk_download/
#   → WiFi & Bluetooth → MediaTek MT7925/MT7927 WiFi driver
# Place the ZIP in this directory before running makepkg.

pkgname=mediatek-mt7927-dkms
pkgver=2.8
pkgrel=1
# Keywords: MT7927 MT7925 MT6639 MT7902 Filogic 380 WiFi 7 Bluetooth btusb mt7925e mt7921e
pkgdesc="DKMS Bluetooth (MT6639) and WiFi (MT7925e/MT7902) modules for MediaTek MT7927 Filogic 380"
arch=('x86_64')
url="https://github.com/jetm/mediatek-mt7927-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('python' 'curl')
provides=('mediatek-mt6639-bt-dkms' 'mediatek-mt7925-wifi-dkms')
conflicts=('btusb-mt7925-dkms' 'btusb-mt7927-dkms')
install=mediatek-mt7927-dkms.install

# NOTE: Newer firmware exists on station-drivers.com (v25.030.3.0057, 2026-01-18).
# Contains mtkwlan.dat at Wlan/Drivers/7925/mtkwlan.dat. Tested by marcin-fm - did
# not fix TX retransmissions. Requires manual browser download (JS-based).
#   https://station-drivers.com/index.php/en/component/remository/Drivers/MediaTek/MediaTek-MT7927-MT7925-Wireless-Lan/
_driver_filename='DRV_WiFi_MTK_MT7925_MT7927_TP_W11_64_V5603998_20250709R.zip'
_driver_sha256='b377fffa28208bb1671a0eb219c84c62fba4cd6f92161b74e4b0909476307cc8'

# Kernel version the mt76 WiFi patches target
_mt76_kver='6.19.9'

source=(
  "https://cdn.kernel.org/pub/linux/kernel/v${_mt76_kver%%.*}.x/linux-${_mt76_kver}.tar.xz"
  'extract_firmware.py'
  'dkms.conf'
)
sha256sums=('c16068a3af12e3943dee3b1eef57ca70229c069128bfa1184fb3f48b219d55bf'
            '5410e79d1c9170264769c7149a78bf588ec85245c1556833605fc1c4657ba37a'
            'b1267e7f9a1eaa41e58e53353d0c0318d155fc3235a047368d299ea20414cc9b')

# Auto-download via ASUS CDN token API
_download_driver_zip() {
  DRIVER_FILENAME="${_driver_filename}" "${startdir}/download-driver.sh" "${SRCDEST:-.}"
}

prepare() {
  local _zips=("${SRCDEST:-.}"/DRV_WiFi_MTK_MT7925_MT7927*.zip)

  # Auto-download if no ZIP found
  if [[ ! -f "${_zips[0]}" ]]; then
    _download_driver_zip
    _zips=("${SRCDEST:-.}/${_driver_filename}")
  fi

  if [[ ! -f "${_zips[0]}" ]]; then
    echo >&2 "No ASUS MT7925/MT7927 WiFi driver ZIP available"
    echo "Download manually from your board's ASUS support page:"
    echo "  https://rog.asus.com/motherboards/rog-crosshair/rog-crosshair-x870e-hero/helpdesk_download/"
    echo "Select: WiFi & Bluetooth → MediaTek MT7925/MT7927 WiFi driver"
    echo "Place the ZIP in the PKGBUILD directory, then run makepkg again."
    return 1
  fi

  if (( ${#_zips[@]} > 1 )); then
    echo >&2 "Multiple ASUS driver ZIPs found — keep only one:"
    for z in "${_zips[@]}"; do echo "  $(basename "$z")"; done
    return 1
  fi

  # Verify integrity if using the known version
  if [[ "$(basename "${_zips[0]}")" == "${_driver_filename}" ]]; then
    echo "Verifying ${_driver_filename}..."
    echo "${_driver_sha256}  ${_zips[0]}" | sha256sum -c - || {
      echo >&2 "SHA256 mismatch for ${_driver_filename}"
      return 1
    }
  fi

  echo "Using driver ZIP: $(basename "${_zips[0]}")"
}

build() {
  local _zips=("${SRCDEST:-.}"/DRV_WiFi_MTK_MT7925_MT7927*.zip)

  make -C "${startdir}" sources \
    MT76_KVER="${_mt76_kver}" \
    KERNEL_TARBALL="${srcdir}/linux-${_mt76_kver}.tar.xz" \
    DRIVER_ZIP="${_zips[0]}" \
    SRCDIR="${srcdir}/_build"
}

package() {
  make -C "${startdir}" install \
    SRCDIR="${srcdir}/_build" \
    DESTDIR="${pkgdir}" \
    VERSION="${pkgver}"
}
