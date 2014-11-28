# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=emptyclip
pkgver=1.0.3
pkgrel=3
pkgdesc="A top-down 2D Action RPG"
url="http://$pkgname.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl_image' 'fmodex' 'ftgl')
makedepends=('scons')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz \
	$pkgname.png \
	$pkgname.desktop)
md5sums=('8e4d4733ba44a9a56304da906e4e8d77'
         '85843f03bfc766cf9bbb3c54eaead48b'
         'eedc8fda09550502c0468e575d9a9002')

build() {
  cd $pkgname

  [ "$CARCH" = "x86_64" ] && sed 's|fmodex"|fmodex64"|g' -i SConstruct

  sed '1i#include <string.h>' -i src/utils.cpp
  sed 's|"profiles/"|"/usr/share/emptyclip/profiles/"|g' -i src/menu.h
  sed 's|"database/"|"/usr/share/emptyclip/database/"|g' -i src/game.cpp

  scons || return 1

  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 ../$pkgname.png \
	$pkgdir/usr/share/pixmaps/$pkgname.png
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -rf database/ profiles/ $pkgdir/usr/share/$pkgname/

  install -Dm644 ../$pkgname.desktop \
	$pkgdir/usr/share/applications/$pkgname.desktop
}
