# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=opentoonz
pkgver=1.4.0
pkgrel=1
pkgdesc='This is software for producing a 2D animation.'
url='https://opentoonz.github.io'
license=('BSD')
arch=('x86_64')
conflicts=('opentoonz-git')
depends=('cblas' 'freeglut' 'glew' 'hicolor-icon-theme' 'libmypaint' 'qt5-multimedia' 'qt5-script' 'qt5-svg' 'superlu')
makedepends=('boost' 'boost-libs' 'cmake' 'qt5-tools')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/opentoonz/opentoonz/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '176caca191bf2747964ecaf8cbb6be6a738fd04b464a2ba182b5aaf96ccaefa9'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/thirdparty/tiff-4.0.3/"
  ./configure --with-pic --disable-jbig && make
  
  cd "${srcdir}/"
  cmake \
    -H"${pkgname}-${pkgver}/toonz/sources" \
    -B"${pkgname}-build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMYPAINT_LIB_INCLUDE_DIRS=/usr/include/libmypaint \
    -DMYPAINT_LIB_LDFLAGS=/usr/lib/libmypaint.so

  cd "${srcdir}/${pkgname}-build/"
  make
}

package() {
  cd "${srcdir}/${pkgname}-build/"
  make DESTDIR="${pkgdir}/" install
  
  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
