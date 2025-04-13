# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=kronos-git
pkgver=2.7.0_official_release.r0.g58352d6
pkgrel=1
pkgdesc="Sega Saturn emulator, fork of yabause"
arch=(x86_64)
url="https://github.com/FCare/Kronos"
license=(GPL-2.0-or-later)
depends=(openal qt5-base qt5-multimedia sdl2 libglvnd glibc gcc-libs)
makedepends=(cmake glu git)
provides=(kronos)
conflicts=(kronos)
source=("git+https://github.com/FCare/Kronos.git")
sha256sums=('SKIP')

pkgver() {
  cd Kronos
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" -Wno-error=format-security"
  export CXXFLAGS+=" -Wno-error=format-security"

  local _flags=(
    -DYAB_USE_QT5=ON
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
