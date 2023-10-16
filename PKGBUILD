# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>

pkgname=mingw-w64-trompeloeil
pkgver=44
pkgrel=1
pkgdesc="Thread-safe header-only mocking framework for C++11/14"
arch=('x86_64')
url="https://github.com/rollbear/trompeloeil"
license=('Boost')
makedepends=(cmake ninja)
checkdepends=(catch2)
source=("trompeloeil-$pkgver.tar.gz::https://github.com/rollbear/trompeloeil/archive/v${pkgver}.tar.gz")
sha256sums=('004877db6ba22f24c7867e112e081eeb68858122f55ebe7c7dd9d8d9e3b46c88')
b2sums=('07a65182c69890a089b6d612db3d9c79ecff427c9ff70342e57807ee2d4631be885435bc90af7717c8a63f8b038699ca2606e055e9a01c180b15048413f0f348')
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
