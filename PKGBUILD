# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ciappi <marco.scopesi@gmail.com>
pkgname=lfortran
pkgver=0.20.3
pkgrel=1
pkgdesc="Modern interactive LLVM-based Fortran compiler"
arch=('x86_64')
url="https://${pkgname}.org"
license=('custom:BSD-3-clause')
depends=(clang zlib ncurses xeus-zmq)
makedepends=(llvm cmake cppzmq)
checkdepends=()
optdepends=()
source=(https://${pkgname}.github.io/tarballs/release/${pkgname}-${pkgver}.tar.gz)
sha512sums=('4fcd723aaa6adf777ba368f5c4c07fd566b6656a8b0f10e7dc96939958b84bc0a59a4265d6710671258fe7e3c82cf68ea57503dde552a46ee8f82bfcacc7cae1')

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
