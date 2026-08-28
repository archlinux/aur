# Maintainer: maci <maci.stgn@gmail.com>

pkgname=mt7927-bt-firmware
pkgver=20250606
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
_driver_zip='DRV_WiFi_MTK_MT7925_MT7927_TP_W11_64_V5603998_20250709R.zip'
_driver_sha256='b377fffa28208bb1671a0eb219c84c62fba4cd6f92161b74e4b0909476307cc8'
_cdn='https://dlcdnta.asus.com/pub/ASUS/mb/08WIRELESS'
_model='ROG%20CROSSHAIR%20X870E%20HERO'

# linux-firmware ships only the WiFi blobs for mt7927, so the Bluetooth one has
# to come out of the vendor driver. The ASUS CDN serves it behind a signed URL
# from its token API, so the ZIP cannot be a source() entry.
_download() {
  local token expires signature key_pair
  msg2 'Requesting a download token from the ASUS CDN...'
  token=$(curl -sf -X POST -H 'Origin: https://rog.asus.com' \
    "https://cdnta.asus.com/api/v1/TokenHQ?filePath=https:%2F%2Fdlcdnta.asus.com%2Fpub%2FASUS%2Fmb%2F08WIRELESS%2F${_driver_zip}%3Fmodel%3D${_model//%/%25}&systemCode=rog")

  expires=${token#*\"expires\":\"};      expires=${expires%%\"*}
  signature=${token#*\"signature\":\"};  signature=${signature%%\"*}
  key_pair=${token#*\"keyPairId\":\"};   key_pair=${key_pair%%\"*}

  msg2 "Downloading ${_driver_zip}..."
  curl -fL -o "$1" \
    "${_cdn}/${_driver_zip}?model=${_model}&Signature=${signature}&Expires=${expires}&Key-Pair-Id=${key_pair}"
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
