# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libopenblas
pkgver=0.3.23
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD. (Designed for can be installed side by side with Blas)"
arch=('x86_64')
url='http://www.openblas.net'
license=('BSD')
depends=('gcc-libs'
         'glibc'
         )
makedepends=('cmake'
             'perl'
             'gcc-fortran'
             )
conflicts=('openblas')
provides=('openblas'
          'libopenblas.so'
          )
source=("OpenBLAS-v${pkgver}.tar.gz::http://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz")
sha256sums=('5d9491d07168a5d00116cdc068a40022c3455bf9293c7cb86a65b1054d7e5114')
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
    -DBUILD_SHARED_LIBS=ON

  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "OpenBLAS-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
