# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ciappi <marco.scopesi@gmail.com>
pkgname=lfortran
pkgver=0.38.0
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
sha512sums=('bc7c9748ee6f2daf4fbb11af4ad5b94d85f429853218a3484b642f33a6cf174e7e7b5d609ec95304502c044eeafdcfef924f53a587d6fd7e57681e74fe7b0e6f')

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
