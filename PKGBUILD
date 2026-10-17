# Maintainer: maci <maci.stgn@gmail.com>

pkgname=mt7927-bt-firmware
pkgver=20260611
pkgrel=1
pkgdesc="Bluetooth firmware for MediaTek MT7927 (MT6639), extracted from the ASUS Windows driver"
arch=('any')
url='https://github.com/openwrt/mt76/issues/927'
license=('LicenseRef-MediaTek-Firmware')
makedepends=('python' 'curl' 'libarchive')
conflicts=('mediatek-mt7927-dkms')
source=('extract-bt-firmware.py')
sha256sums=('013dff1981e158f28ef3db56775ad119bbefd8942d6c9387edfabf057f1fe6c6')

_firmware='BT_RAM_CODE_MT6639_2_1_hdr.bin'
_driver_zip='DRV_WiFi_MTK_MT7925_27_TP_W11_64_V5706054_20260706R.zip'
_driver_sha256='f421e3e6ea7fa335ebb3fb70d76f550709fe2f8bd52633d518e4b42bfa0219cb'
_cdn='https://dlcdnets.asus.com/pub/ASUS/mb/08WIRELESS'

# linux-firmware ships only the WiFi blobs for mt7927, so the Bluetooth one has
# to come out of the vendor driver (ASUS MediaTek WiFi driver V5.7.0.6054,
# 2026/07/16). The ZIP is fetched in prepare() and checked against
# _driver_sha256; if the download fails it can be dropped in manually.
_download() {
  msg2 "Downloading ${_driver_zip}..."
  curl -fL -o "$1" "${_cdn}/${_driver_zip}"
}

prepare() {
  local zip="${SRCDEST:-$startdir}/${_driver_zip}"

  if [[ ! -f $zip ]] && ! _download "$zip"; then
    rm -f "$zip"
    error "Could not download ${_driver_zip} from the ASUS CDN."
    plain 'Fetch it manually from your board support page (WiFi & Bluetooth ->'
    plain "MediaTek MT7925/MT7927 WiFi driver), put it in ${SRCDEST:-$startdir}, and rebuild."
    return 1
  fi

  echo "${_driver_sha256}  ${zip}" | sha256sum -c -
  bsdtar -xf "$zip" -C "$srcdir" mtkwlan.dat
}

build() {
  python extract-bt-firmware.py mtkwlan.dat "$_firmware" "$_firmware"
}

package() {
  install -Dm644 "$_firmware" "$pkgdir/usr/lib/firmware/mediatek/mt7927/$_firmware"
}
