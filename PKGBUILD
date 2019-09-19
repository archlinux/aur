# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=opentoonz
pkgver=1.3.0
pkgrel=3
pkgdesc='This is software for producing a 2D animation.'
url='https://opentoonz.github.io'
license=('BSD')
arch=('x86_64')
conflicts=('opentoonz-git')
depends=('cblas' 'freeglut' 'glew' 'hicolor-icon-theme' 'libmypaint' 'qt5-multimedia' 'qt5-script' 'qt5-svg' 'sdl2' 'superlu')
makedepends=('boost' 'boost-libs' 'cmake' 'qt5-tools')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/opentoonz/opentoonz/archive/v${pkgver}.tar.gz"
  "${pkgname}-build.patch::https://github.com/opentoonz/opentoonz/commit/adae1528d6f580d56b5499c97b30acfb84af4390.patch"
)
sha256sums=(
  'a5dd0286a58017a086a3533016b9b4f54ada25a230c62de63b995bc04d0cd5a8'
  '9b8b4a68d3af0941ed83e655b68cf25037fedff24a53e3ae224b7f56337ab6f2'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/${pkgname}-build.patch"
}

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
