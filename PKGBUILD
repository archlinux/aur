# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>

pkgname=mingw-w64-trompeloeil
pkgver=48
pkgrel=1
pkgdesc="Thread-safe header-only mocking framework for C++11/14"
arch=('x86_64')
url="https://github.com/rollbear/trompeloeil"
license=('Boost')
makedepends=(cmake ninja)
checkdepends=(catch2)
source=("trompeloeil-$pkgver.tar.gz::https://github.com/rollbear/trompeloeil/archive/v${pkgver}.tar.gz")
sha256sums=('eebd18456975251ea3450b815e241cccfefba5b883e4a36bd309f9cf629bdec6')
b2sums=('8f1a1214953f0acac49da8a211320fa76bc7176ff8163fae6f63b1e86bce213aab0e5ad7f62ae3e2d5bb2611a69a6d9fec0467d4c596021a47a280c43d1df714')
# Build fails with `buildflags` because ld.exe doesn't recognize `-z`
options=(!buildflags !strip)

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

build() {
  for _arch in ${_architectures}; do
    $_arch-cmake \
      -Bbuild-$_arch \
      -GNinja \
      -S "trompeloeil-$pkgver" \
      -DCMAKE_BUILD_TYPE='Debug' \
      -DTROMPELOEIL_INSTALL_TARGETS=ON \
      -DTROMPELOEIL_INSTALL_DOCS=OFF \
      -Wno-dev
    cmake --build build-$_arch
  done
}


package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build-$_arch
    install -Dm644 "${srcdir}/trompeloeil-${pkgver}/LICENSE_1_0.txt" "${pkgdir}/usr/share/licenses/mingw-w64-trompeloeil/LICENSE"
  done
}

# vim:set ts=2 sw=2 et:
