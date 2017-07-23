pkgname=kodi-addon-game-libretro-git
pkgver=r45611.dece753328
pkgrel=1
pkgdesc='Game addons for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-game"
license=('GPL')
makedepends=('cmake' 'git')
depends=('kodi')
source=("$pkgname::git+https://github.com/xbmc/xbmc.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf "$srcdir/$pkgname/build"
  mkdir "$srcdir/$pkgname/build"
}


build() {
  cd "$srcdir/$pkgname/build"
  
  echo "binary-addons https://github.com/kodi-game/repo-binary-addons.git retroplayer" > $srcdir/$pkgname/cmake/addons/bootstrap/repositories/binary-addons.txt
  
  cmake -DADDONS_TO_BUILD="game.libretro game.libretro.gambatte game.libretro.snes9x game.libretro.scummvm game.libretro.yabause game.controller.snes" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=dest/ \
    -DPACKAGE_ZIP=1 \
    ../cmake/addons/

  make
}

package() {
  cd "$srcdir/$pkgname/build"
  mkdir -p "$pkgdir/usr/share/kodi/addons"
  
  rm -rf $srcdir/$pkgname/build/dest/{share,lib}
  cp -Tr "$srcdir/$pkgname/build/dest/" "$pkgdir/usr/share/kodi/addons"
}

