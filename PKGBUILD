# Maintainer: Simon Dreher <code[at]simon-dreher[dot]de>
pkgname=alacarte-maps-git
pkgver=0.3.0.r120.gdafa288
pkgrel=1
pkgdesc="An easy to use, fast and flexible tile renderer and server for OSM data."
url="https://alacarte-maps.github.io"
arch=('x86_64' 'i686')
license=('AGPL3')
depends=('cairo>=1.12.0' 'boost>=1.55' 'libpng')
makedepends=('cmake' 'asciidoc')

source=("git+https://github.com/alacarte-maps/alacarte")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/alacarte"
  [[ -d build ]] && rm -r build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. -DCMAKE_BUILD_TYPE=Release
  make
  make man
}

package() {
  cd "${srcdir}/alacarte/build"
  make DESTDIR=${pkgdir} install
  install -D -m644 "${srcdir}/alacarte/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/alacarte/data/alacarte-maps.service" "${pkgdir}/usr/lib/systemd/system/alacarte-maps.service"
}

pkgver() {
  cd "alacarte"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
