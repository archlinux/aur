# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ciappi <marco.scopesi@gmail.com>
pkgname=lfortran
pkgver=0.19.0
pkgrel=1
pkgdesc="Modern interactive LLVM-based Fortran compiler"
arch=('x86_64')
url="https://${pkgname}.org"
license=('custom:BSD-3-clause')
depends=(clang zlib ncurses xeus-zmq)
makedepends=(llvm cmake cppzmq)
checkdepends=()
optdepends=()
source=(https://${pkgname}.github.io/tarballs/release/${pkgname}-${pkgver}.tar.gz
  llvm15.patch::https://github.com/lfortran/lfortran/pull/1791.patch)
sha512sums=('b70c71c537f6df29986b15e35fd45147267d459d5ee383aa45011cbad5eaed2d4bac9a465856b887181cd81e80fa2cfa7497956e3d5a04a173cd2e514d15291a'
  '7d72e6c767d9dd641853cf30f6e5e5b0cda2ba7a985f4049e72f550edeb8cf48a0343e42a7e921e2211be868120f986d4753a2a68842dfcbe2808ecc567ab31c')

prepare() {
  cd ${pkgname}-${pkgver}
  # https://github.com/lfortran/lfortran/issues/1777
  patch -p1 -i ../llvm15.patch
}

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
