# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ciappi <marco.scopesi@gmail.com>
pkgname=lfortran
pkgver=0.43.0
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
sha512sums=('9317ed868893c74a50d9f9adf237e73391b3b9fca7667f1e3f065b683b4d87f4967b4dd89862da6377675430b58762e14bdb8288e2e906648f85d5097058fbf8')

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
