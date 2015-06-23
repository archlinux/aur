# Maintainer: Max Kueng <me [at] maxkueng [dot] com>
pkgname=yakyak
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop client for Google Hangouts"
arch=('x86_64' 'i686')
url="https://github.com/yakyak/yakyak"
license=('MIT')
makedepends=('unzip' 'nodejs' 'npm')
depends=('libgcrypt15' 'libnotify' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring')

_electron_version=0.28.1
_platform=ia32
[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("https://github.com/yakyak/yakyak/archive/v${pkgver}.tar.gz")
source_i686=("https://github.com/atom/electron/releases/download/v${_electron_version}/electron-v${_electron_version}-linux-ia32.zip")
source_x86_64=("https://github.com/atom/electron/releases/download/v${_electron_version}/electron-v${_electron_version}-linux-x64.zip")

sha256sums=('0532e1ce1d32bf671d2ad362d60ab22b94f02f65ba4a6334ce6f7e556fe290a4')
sha256sums_i686=('b7fcfad602f7e7b4cdf5c279d66ff077b176c1cb9fc0ee56697a185988634ed6')
sha256sums_x86_64=('f78a609c23bb35fa564ad8d6ed62cd2a92213a4e5ab8103a069a953177ad44b9')

noextract=("electron-v${_electron_version}-linux-${_arch}.zip")

build() {
  unzip "electron-v${_electron_version}-linux-${_arch}.zip" -d "${srcdir}/electron-${_electron_version}"
  mv "${srcdir}/electron-${_electron_version}/electron" "${srcdir}/electron-${_electron_version}/yakyak"

  cd "${srcdir}/yakyak-${pkgver}"
  npm install
  ./node_modules/gulp/bin/gulp.js

  cp -a "${srcdir}/yakyak-${pkgver}/app" "${srcdir}/electron-${_electron_version}/resources/"
}

package() {
  install -dm755 "${pkgdir}/usr/share/"
  cp -R "${srcdir}/electron-${_electron_version}" "${pkgdir}/tmp"
  mv "${pkgdir}/tmp" "${pkgdir}/usr/share/${pkgname}"
  touch "${pkgdir}/usr/share/${pkgname}/resources/app/node_modules/hangupsjs/cookies.json"
  chmod 777 "${pkgdir}/usr/share/${pkgname}/resources/app/node_modules/hangupsjs/cookies.json"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/yakyak" "${pkgdir}/usr/bin/${pkgname}"
}
