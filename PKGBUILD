# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ciappi <marco.scopesi@gmail.com>
pkgname=lfortran
pkgver=0.64.0
pkgrel=1
pkgdesc="Modern interactive LLVM-based Fortran compiler"
arch=(x86_64)
url="https://${pkgname}.org"
license=(BSD-3-Clause)
depends=(clang kokkos zlib ncurses xeus-zmq)
makedepends=(llvm cmake cppzmq zstd libunwind pandoc-cli re2c)
checkdepends=()
optdepends=()
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('da4699242c2d42a60138b0e9a27f8511107103e49907da5187860531d297db94860c35e5415d0e33b2bb4ccf119380bd89e3e6a69531fe5f1235d2881e0abe2a')

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
    -DWITH_ZLIB=yes \
    -DWITH_ZSTD=yes \
    -DUSE_DYNAMIC_ZSTD=yes \
    -Wno-dev

  cmake --build build --target all
}

check() {
  ctest --verbose --output-on-failure --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
