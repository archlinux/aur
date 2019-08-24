# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=pianobooster-qt5-git
_pkgname=pianobooster
pkgver=r1053.94c58b1
pkgrel=1
pkgdesc="MIDI file player that teaches you how to play the piano (Qt5 port with fixes"
url="https://github.com/captnfab/PianoBooster"
depends=('qt5-base' 'alsa-lib' 'ftgl' 'hicolor-icon-theme' 'desktop-file-utils' 'ttf-dejavu')
makedepends=('git' 'cmake')
conflicts=(pianobooster)
license=('GPL3')
arch=('x86_64' 'i686')
arch=('any')
source=("${pkgname}"::'git+https://github.com/captnfab/PianoBooster.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  cd translations
  for i in *.ts
  do
    lrelease "$i"
  done
} 
 

build() {
  install -d ${srcdir}/${pkgname}/build
  cd ${srcdir}/${pkgname}/build
  cmake ../src 
  make
}

package() {
  cd ${srcdir}/${pkgname}
  install -d "${pkgdir}/usr/share/games/pianobooster/translations"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm664 "src/images/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm664 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm664 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm664 "TODO.md" "${pkgdir}/usr/share/doc/${_pkgname}/TODO.md"
  install -Dm644 translations/*.qm "${pkgdir}/usr/share/games/pianobooster/translations"
}

# vim:set ts=2 sw=2 et:
