# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=scavenger
pkgver=145.1
pkgrel=2
pkgdesc="2D arcade/thinking game like Lode Runner (SDL version)"
arch=('i686' 'x86_64')
url="http://www.xdr.com/dash/scavenger.html"
license=('GPL')
depends=('sdl')
source=("http://downloads.sourceforge.net/sdlscavenger/sdlscav-${pkgver}_2010_11_5.tgz"
        "$pkgname.desktop"
        "$pkgname-fs.desktop")
md5sums=('995dc8b6b1792e1c2c9ec253bcfafbfe'
         'SKIP'
         'SKIP')

prepare() {
  cd sdlscav-145

  # add our cflags
  sed -i "s|-O2|${CFLAGS}|" Makefile
  # delete lines touching our home directory
  sed -i "8,9d" Makefile
  # set data path
  sed -i "s|/usr/local/games|/usr/share|" names.h
}

build() {
  cd sdlscav-145

  make
}

package() {
  cd sdlscav-145

  # install game files
  install -d $pkgdir/usr/share/$pkgname/rc
  install -m644 data/*rc $pkgdir/usr/share/$pkgname/rc
  install -m644 data/*.{lbm,scl,wav} $pkgdir/usr/share/$pkgname
  install -Dm755 sdlscav $pkgdir/usr/bin/$pkgname

  # install the pixmap and desktop file
  install -Dm644 data/scav.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
