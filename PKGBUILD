# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=fheroes2-svn
pkgver=0.r3279
pkgrel=1
pkgdesc="Free implementation of Heroes of the Might and Magic II engine"
arch=('i686' 'x86_64' 'armv7h')
url="https://sourceforge.net/projects/fheroes2/"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf')
makedepends=('subversion' 'gettext')
source=(fheroes2::svn+https://svn.code.sf.net/p/fheroes2/code/trunk
        fheroes2.desktop
        fheroes2.sh)
install=fheroes2.install
md5sums=('SKIP'
         '0d52069db426be17ce9dbd5deb20d4fd'
         'a39dd6625e7d1582c85087937e00f074')

pkgver() {
  cd "$srcdir/fheroes2"
  echo "0.r$(svnversion)"
}

build() {
  cd "$srcdir/fheroes2/fheroes2/src"
  sed -i 's/libpng12-config/libpng14-config/g' Makefile
  sed -i '30i#include <unistd.h>' fheroes2/dialog/dialog_selectfile.cpp
  make RELEASE=1 WITH_AI=simple
}

package() {
  cd "$srcdir/fheroes2/fheroes2"
  install -Dm755 "$srcdir/fheroes2.sh" "$pkgdir/usr/bin/fheroes2"
  install -Dm644 "$srcdir/fheroes2.desktop" "$pkgdir/usr/share/applications/fheroes2.desktop"
  install -Dm644 "$srcdir/fheroes2/fheroes2/image/fheroes2_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/fheroes2.png"
  install -Dm755 "$srcdir/fheroes2/fheroes2/src/dist/fheroes2" "$pkgdir/usr/share/fheroes2/fheroes2"
  install -Dm644 "$srcdir/fheroes2/fheroes2/fheroes2.cfg" "$pkgdir/usr/share/fheroes2/fheroes2.cfg"
  install -dm755 "$pkgdir/usr/share/fheroes2/data" "$pkgdir/usr/share/fheroes2/maps"
}

# vim:set ts=2 sw=2 et:
