# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='veroroute'
pkgname="${_pkgname}-svn"
pkgver=2.00.r265
pkgrel=1
pkgdesc='Veroboard, Perfboard, and PCB layout and routing application'
arch=('x86_64')
url='https://sourceforge.net/projects/veroroute/'
license=('GPL3')
depends=('qt5-base')
makedepends=('subversion')
optdepends=('geda-gaf: import schematic from gEDA')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::svn+https://svn.code.sf.net/p/${_pkgname}/code/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  local revision="$(svnversion)"
  printf "%s.r%s" "$(grep -Po '^V\K[0-9.]+' 'CHANGELOG.txt' | tail -1)" "${revision//[[:alpha:]]}"
}

build() {
  cd "${_pkgname}"
  qmake-qt5 \
    PREFIX=/usr \
    QMAKE_CFLAGS="$CFLAGS" \
    QMAKE_CXXFLAGS="$CXXFLAGS" \
    QMAKE_LFLAGS="$LDFLAGS" \
    src/veroroute.pro
  make
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${_pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "${_pkgname}.png"
  install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}" "${_pkgname}.png"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${_pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.txt'

  install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}/tutorials" 'tutorials/'*.vrt
  install -Dm644 -t "${pkgdir}/usr/share/gEDA/gafrc.d" "libraries/gEDA/${_pkgname}-clib.scm"

  install -d "${pkgdir}/usr/share/gEDA/sym"
  cd 'libraries/gEDA'
  find . -mindepth 2 -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/gEDA/sym/{}" \;
}

# vim: ts=2 sw=2 et:
