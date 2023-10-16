# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>

pkgname=mingw-w64-trompeloeil
pkgver=45
pkgrel=1
pkgdesc="Thread-safe header-only mocking framework for C++11/14"
arch=('x86_64')
url="https://github.com/rollbear/trompeloeil"
license=('Boost')
makedepends=(cmake ninja)
checkdepends=(catch2)
source=("trompeloeil-$pkgver.tar.gz::https://github.com/rollbear/trompeloeil/archive/v${pkgver}.tar.gz")
sha256sums=('124b0aa45d84415193719376b6557fc1f1180cbfebf4dc4f7ca247cb404d6bd8')
b2sums=('fee17091aef4199f1ac425af0e967007e1bd03d4ccb67fb78c6a061ed8d3bb4d825f4c379dc51e56078605a915bb3389ecc4e56097f2f4b509acfca5982e1da7')
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
