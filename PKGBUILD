# Maintainer: Vaporeon <vaporeon@tfwno.gf>

pkgname=libretro-mgba-git
pkgver=r2918.b8b7ec0
pkgrel=1
pkgdesc='A Nintendo Gameboy Advance Emulator - Libretro Core'
arch=('i686' 'x86_64')
url="https://endrift.com/mgba/"
license=('custom:MPL2')
makedepends=('git' 'cmake')
conflicts=('libretro-mgba')
provides=('libretro-mgba')
source=("git+https://github.com/mgba-emu/mgba.git"
        "https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/mgba_libretro.info")
sha1sums=('SKIP'
          '073ea68fe979aaa13cf0b65ff7460dd16c13bbcf')
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
  install -Dm644 "$srcdir"/mgba_libretro.info "$pkgdir"/usr/lib/libretro/mgba_libretro.info
  install -Dm644 "$srcdir"/mgba/LICENSE "$pkgdir"/usr/share/licenses/libretro-mgba/LICENSE
}
