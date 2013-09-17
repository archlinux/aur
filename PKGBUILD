# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=easyrpg-player
pkgver=0.1.1
pkgrel=3
pkgdesc="EasyRPG Player aims to be a free, RPG Maker 2000/2003 interpreter."
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
conflicts=('easyrpg-player-git')
makedepends=('cmake>=2.8' 'boost')
depends=('sdl_mixer' 'freetype2' 'pixman' 'libpng' 'libjpeg' 'boost-libs' 'openal' 'libsndfile' 'lua51' 'expat')
install="$pkgname.install"
source=("https://easy-rpg.org/downloads/player/EasyRPG_Player-$pkgver-src.zip"
        "$pkgname.install")
md5sums=('e6b0e42d98b993a0119a92dd0593acda'
         '8ceae8f6dfa0eeff7e8029e6ee792386')
sha256sums=('db0f3c910c7aaf881e5d472becb666ed22281ae3ff1220c4191f806f5afa38c9'
            '187f2c695b2ad0471cea3679956ab77e1c191b082182ee6d776447990ef1edc1')

prepare () {
  cd "$srcdir"

  # remove old build
  rm -rf build

  cd "$srcdir/Player-0.1.1/src/"

  # patch to fix build with newer libpng
  grep -v -q cstring image_png.cpp
  [ $? -eq 0 ] && sed -i 's|#include <cstdlib>|#include <cstdlib>\n#include <cstring>|' image_png.cpp
}

build () {
  cd "$srcdir"

  mkdir build
  cd build

  # work around lua linking problems
  cmake ../Player-0.1.1/builds/cmake/ -DLUA_INCLUDE_DIR="/usr/include/lua5.1" -DCMAKE_EXE_LINKER_FLAGS="-Wl,--no-as-needed" -DCMAKE_INSTALL_PREFIX="/usr"

  make
}

package () {
  cd "$srcdir/build"

  DESTDIR="$pkgdir" make install
}
