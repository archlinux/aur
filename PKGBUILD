# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=kronos-git
pkgver=r7559.1844f3c6f
pkgrel=1
pkgdesc="Sega Saturn emulator, fork of yabause"
arch=(x86_64)
url="https://github.com/FCare/Kronos"
license=(GPL-2.0-or-later)
depends=(openal qt5-base qt5-multimedia sdl2 libglvnd glibc gcc-libs)
makedepends=(cmake glu git gcc13)
provides=(kronos)
conflicts=(kronos)
source=("git+https://github.com/FCare/Kronos.git")
sha256sums=('SKIP')

pkgver() {
  cd Kronos
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CC=/usr/bin/gcc-13 CXX=/usr/bin/g++-13
  export CFLAGS+=" -Wno-error=format-security"
  export CXXFLAGS+=" -Wno-error=format-security"

  cmake -B build -S "Kronos/yabause" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DYAB_USE_QT5=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
