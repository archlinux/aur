# Maintainer: Bart De Vries <devriesb at gmail dot com>

pkgname=chromium-widevine-armv7h
pkgdesc='A browser plugin designed for the viewing of premium video content (version for armv7h)'
pkgver=4.10.1503.4
pkgrel=1
#list od current images https://dl.google.com/dl/edgedl/chromeos/recovery/recovery.conf
_chromeos_ver=12371.75.0
_chromeos_file="chromeos_${_chromeos_ver}_elm_recovery_stable-channel_mp-v2.bin"
_rootfs_img="ROOT-A.img"
_libwidevine="libwidevinecdm.so"
arch=('armv7h')
url='https://www.widevine.com/'
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')
provides=('chromium-widevine')
conflicts=('chromium-widevine')
makedepends=('p7zip')
options=('!strip')
source=("chrome-eula_text.html::https://www.google.com/intl/en/chrome/privacy/eula_text.html"
        "https://dl.google.com/dl/edgedl/chromeos/recovery/${_chromeos_file}.zip")
noextract=("${_chromeos_file}.zip")
sha256sums=('0e0bf73c196caa38531ef5f3843040e042bad85657d4e8ac5e60deb694b684dd'
            '32d00d5ebdae667c843452eb1c87bd8aab6ff4f2520b3b461141bb78de7a0752')

prepare() {
  gcc ../get_cdm_version.c -o get_cdm_version -ldl
  7z e ../${_chromeos_file}.zip -y
  7z e ${_chromeos_file} ${_rootfs_img} -y
  7z e ${_rootfs_img} ${_libwidevine} -r -y
 }

pkgver() {
  ./get_cdm_version
}

package() {
  install -Dm644 ${_libwidevine} -t "$pkgdir/usr/lib/chromium/"
  install -Dm644 ../chrome-eula_text.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
}
