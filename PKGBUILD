# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ciappi <marco.scopesi@gmail.com>
pkgname=lfortran
pkgver=0.34.0
pkgrel=1
pkgdesc="Modern interactive LLVM-based Fortran compiler"
arch=(x86_64)
url="https://${pkgname}.org"
license=(BSD-3-Clause)
depends=(clang kokkos zlib ncurses xeus-zmq)
makedepends=(llvm cmake cppzmq zstd-static)
checkdepends=()
optdepends=()
source=(https://${pkgname}.github.io/tarballs/release/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b20cea79768404f232e4af6a5cd16acc4a5fc05970c44aa61cd4ffead5d69c028f7998684ae723bd985675e00300f946bbab4f79fcb8e14db970732094efff41')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DWITH_LLVM=yes \
    -DWITH_RUNTIME_LIBRARY=yes \
    -DWITH_XEUS=yes \
    -DWITH_KOKKOS=yes \
    -DWITH_ZLIB=yes

  cmake --build build --target all
}

check() {
  ctest --verbose --output-on-failure --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
