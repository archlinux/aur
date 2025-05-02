# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=kronos-git
pkgver=2.7.0_official_release.r5.gd0384bc
pkgrel=2
pkgdesc="Sega Saturn emulator, fork of yabause"
arch=(x86_64)
url="https://github.com/FCare/Kronos"
license=(GPL-2.0-or-later)
depends=(openal qt5-base qt5-multimedia sdl2 libglvnd glibc gcc-libs)
makedepends=(cmake glu git)
provides=(kronos)
conflicts=(kronos)
source=("git+https://github.com/FCare/Kronos.git"
        https://github.com/FabioLolix/AUR-artifacts/raw/master/kronos-cmake_minimum_version.patch)
sha256sums=('SKIP'
            '9266ab881e4a1c94ba706cfa8b9a7157d1e76dab4b65e47b61c738685e31fdb6')

pkgver() {
  cd Kronos
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Kronos
  patch -Np1 -i ../kronos-cmake_minimum_version.patch
}

build() {
  export CFLAGS+=" -Wno-error=format-security"
  export CXXFLAGS+=" -Wno-error=format-security"

  local _flags=(
    -DYAB_USE_QT5=ON
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cmake -B build -S "Kronos/yabause" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
