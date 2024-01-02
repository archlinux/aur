# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>

pkgname=mingw-w64-trompeloeil
pkgver=47
pkgrel=1
pkgdesc="Thread-safe header-only mocking framework for C++11/14"
arch=('x86_64')
url="https://github.com/rollbear/trompeloeil"
license=('Boost')
makedepends=(cmake ninja)
checkdepends=(catch2)
source=("trompeloeil-$pkgver.tar.gz::https://github.com/rollbear/trompeloeil/archive/v${pkgver}.tar.gz")
sha256sums=('4a1d79260c1e49e065efe0817c8b9646098ba27eed1802b0c3ba7d959e4e5e84')
b2sums=('2ea8bf5f5a730c637742aded374bb4c09b7ed1972a88dcd3aec0784559b72f3938269fb9c898934bc6eb69ff543249b70e6e2eb596860940a5d37c97192fa20f')
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
