# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>

pkgname=mingw-w64-trompeloeil
pkgver=49
pkgrel=1
pkgdesc="Thread-safe header-only mocking framework for C++11/14"
arch=('x86_64')
url="https://github.com/rollbear/trompeloeil"
license=('Boost')
makedepends=(cmake ninja)
checkdepends=(catch2)
source=("trompeloeil-$pkgver.tar.gz::https://github.com/rollbear/trompeloeil/archive/v${pkgver}.tar.gz")
sha256sums=('2523571fb7920b2813cbc23b46e60294aba8ead7eba434bfec69c24408615593')
b2sums=('b6e5807f43becc27ea6cee6614485cf537c81eb12dee92e47800470673f7b912a20d30318e6c1bb3abc5a7f3013db89b60bea36962f8694305d5e807b46d8ad0')
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
