# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=kronos
pkgver=2.7.0
pkgrel=2
pkgdesc="Sega Saturn emulator, fork of yabause"
arch=(x86_64 aarch64 i686 pentium4)
url="https://github.com/FCare/Kronos"
license=(GPL-2.0-or-later)
depends=(openal qt5-base qt5-multimedia sdl2 libglvnd glibc gcc-libs)
makedepends=(cmake glu)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FCare/Kronos/archive/refs/tags/${pkgver}_official_release.tar.gz"
        https://github.com/FabioLolix/AUR-artifacts/raw/master/kronos-cmake_minimum_version.patch)
b2sums=('67ff8a57f61e733a67281c7d0af84b4c20209088b957dec911e926b250770050b015671df604104c070db97ef7018394a1a355b1017d24e155f3af999ef05a7f'
        'ed7df989321afb305dd34610182914b907fa7394a812c7d03c9bdeebca390edaefc37ce2e7ee42d8c53e5ac390f63309b05d8cf1b7f425d21d66d2e4395195d9')

prepare() {
  cd Kronos-${pkgver}_official_release
  patch -Np1 -i ../kronos-cmake_minimum_version.patch
}

build() {
  export CFLAGS+=" -Wno-error=format-security"
  export CXXFLAGS+=" -Wno-error=format-security"

  local _flags=(
    -DYAB_USE_QT5=ON
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cmake -B build -S "Kronos-${pkgver}_official_release/yabause" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
