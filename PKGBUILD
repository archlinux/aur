# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=libretro-mgba-git
pkgver=r4970.bfb674fb
pkgrel=1
pkgdesc='A Nintendo Gameboy Advance Emulator - Libretro Core'
arch=('i686' 'x86_64')
url="https://mgba.io/"
license=('custom:MPL2')
depends=('libretro-core-info')
makedepends=('git' 'cmake')
conflicts=('libretro-mgba')
provides=('libretro-mgba')
source=("git+https://github.com/mgba-emu/mgba.git")
sha1sums=('SKIP')

pkgver() {
  cd mgba
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
}

build() {
  cd build
  cmake "$srcdir"/mgba -DBUILD_LIBRETRO=ON -DBUILD_QT=OFF \
    -DBUILD_SDL=OFF -DBUILD_SHARED=OFF -DBUILD_STATIC=ON
  make
}

package() {
  install -Dm644 "$srcdir"/build/mgba_libretro.so "$pkgdir"/usr/lib/libretro/mgba_libretro.so
  install -Dm644 "$srcdir"/mgba/LICENSE "$pkgdir"/usr/share/licenses/libretro-mgba/LICENSE
  mkdir -p "$pkgdir"/usr/lib/retro-1.0/plugins
  ln -s /usr/lib/libretro/mgba_libretro.so "$pkgdir"/usr/lib/retro-1.0/plugins/libretro-game-boy-advance.so
}
