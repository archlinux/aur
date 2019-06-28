# Maintainer: muchweb <aleks@s-ko.net>

pkgname=tidal-music-linux-git
_pkgname=tidal-music-linux
replaces=('tidal-music-linux-bin')
pkgver=3.0
pkgrel=1
pkgdesc='An electron based wrapper around the Tidal web player for Linux'
arch=('x86_64')
url='https://github.com/Bunkerbewohner/tidal-music-linux'
license=('MIT')
# dunno if needed: libxtst alsa-lib gconf libnotify gtk2 nss
depends=('pepper-flash' 'electron')
makedepends=('nodejs' 'git' 'npm')
provides=('tidal')
source=(
  'git+https://github.com/Bunkerbewohner/tidal-music-linux.git'
  "${_pkgname}.desktop"
  'tidal'
)
sha256sums=(
  'SKIP'
  'ca8c35585f0f67acf5a311c8127d2f77b022d419ced26df123349ad194557a72'
  '5cf0a00a9eb28019a6126491ddfc4b5455bcd44d43be05f81544d438dface390'
)

build() {
  pushd "${srcdir}/${_pkgname}"
  npm install --production
  popd
}

package() {
  # license
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

  # source
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -v "${srcdir}/${_pkgname}/icon.png" "${pkgdir}/usr/share/${pkgname}"
  cp -v "${srcdir}/${_pkgname}/main.js" "${pkgdir}/usr/share/${pkgname}"
  cp -v "${srcdir}/${_pkgname}/index.html" "${pkgdir}/usr/share/${pkgname}"
  cp -rv "${srcdir}/${_pkgname}/node_modules" "${pkgdir}/usr/share/${pkgname}"
  cp -v "${srcdir}/${_pkgname}/preload.js" "${pkgdir}/usr/share/${pkgname}"
  cp -v "${srcdir}/${_pkgname}/style.css" "${pkgdir}/usr/share/${pkgname}"
  cp -v "${srcdir}/${_pkgname}/pepper-paths.json" "${pkgdir}/usr/share/${pkgname}"

  # bin
  mkdir -p "${pkgdir}/usr/bin"
  install -D "tidal" "${pkgdir}/usr/bin/tidal"

  # .desktop
  install -D "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
