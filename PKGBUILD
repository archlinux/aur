# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libopenblas
pkgver=0.3.20
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
sha256sums=('8495c9affc536253648e942908e88e097f2ec7753ede55aca52e5dead3029e3c')
options=('!emptydirs' 'debug')

prepare() {
  # set cmake file path in DCMAKE_INSTALL_LIBDIR
  sed 's|share/cmake/${PN}${SUFFIX64}|${CMAKE_INSTALL_LIBDIR}/cmake/${PN}${SUFFIX64}|g' \
    -i "OpenBLAS-${pkgver}/CMakeLists.txt"
}

build() {
  cmake -S "OpenBLAS-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_INCLUDEDIR=include/openblas \
    -DBUILD_SHARED_LIBS=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install

  install -Dm644 "OpenBLAS-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
