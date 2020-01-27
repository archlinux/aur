# Maintainer: Bart De Vries <devriesb at gmail dot com>

pkgname='pepper-flash-armv7h'
pkgdesc='Adobe Flash Player (version for armv7h)'
pkgver=32.0.0.303
pkgrel=1
#list od current images https://dl.google.com/dl/edgedl/chromeos/recovery/recovery.conf
_chromeos_ver=12607.58.0
_chromeos_file="chromeos_${_chromeos_ver}_elm_recovery_stable-channel_mp-v2.bin"
_rootfs_img="ROOT-A.img"
_libpepperflash="libpepflashplayer.so"
arch=('armv7h')
url='https://www.adobe.com/nl/products/flashplayer.html'
license=('custom')
depends=('gcc-libs')
provides=('pepper-flash')
conflicts=('pepper-flash')
makedepends=('p7zip')
options=('!strip')
source=("license.pdf::https://wwwimages2.adobe.com/www.adobe.com/content/dam/acom/en/legal/licenses-terms/pdf/PlatformClients_PC_WWEULA-en_US-20150407_1357.pdf"
        "manifest-src.json"
        "https://dl.google.com/dl/edgedl/chromeos/recovery/${_chromeos_file}.zip")
noextract=("${_chromeos_file}.zip")
sha256sums=('5a0a95eb4082b6db7182188ce119f3829184b238b0a91293322c2a51a2b41fc1'
            'c1bc83f31ac585124861537dc5e61e244acdf1c6d4042deb70d757d3b5abb388'
            '629c9077a1cf70eb7c8fd3b86d3bb7d1155b27cc0ce1f5b3c978d48806e5a128')

prepare() {
  7z e ../${_chromeos_file}.zip -y
  7z e ${_chromeos_file} ${_rootfs_img} -y
  7z e ${_rootfs_img} ${_libpepperflash} -r -y
  7z e ${_rootfs_img} pepper-flash.info -r -y
}

pkgver() {
  awk -F'"' '{if ($1=="VERSION=") {print $2}}' pepper-flash.info
}

package() {
  sed "s/VERSION-REPLACE/${pkgver}/g" manifest-src.json > manifest.json
  install -Dm644 -t "$pkgdir/usr/lib/PepperFlash/" ${_libpepperflash}
  install -Dm644 -t "$pkgdir/usr/lib/PepperFlash/" manifest.json
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.pdf
}
