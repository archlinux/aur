# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libopenblas
pkgver=0.3.17
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD. (Designed for can be installed side by side with Blas)"
arch=('x86_64')
url='http://www.openblas.net'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake'
             'perl'
             'gcc-fortran'
             )
conflicts=('openblas')
provides=('openblas')
source=("OpenBLAS-v${pkgver}.tar.gz::http://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz")
sha256sums=('df2934fa33d04fd84d839ca698280df55c690c86a5a1133b3f7266fce1de279f')
options=('!emptydirs')

prepare() {
  mkdir -p build
  # follow cmake search path
  sed 's|cmake/${PN}${SUFFIX64}|${PN}${SUFFIX64}/cmake|g' \
    -i "OpenBLAS-${pkgver}/CMakeLists.txt"
}

build() {
  cd build
  cmake "../OpenBLAS-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_INCLUDEDIR=include/openblas \
    -DBUILD_SHARED_LIBS=ON

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "OpenBLAS-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
