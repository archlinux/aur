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
sha256sums=('c63666c0783d05b24895065781608994c43e4b359605be6806845b46f093d016'
            '676a680f256138391bd11a18a6f40499ecf8113cd1345621ed429f612c9e1c7a'
            'c376b2cfc6e6a621ddb871fd4d5a26f6a1c758362eb9feda1effcf898db0f73e')

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
  install -d "$pkgdir"/usr/share/$pkgname/rc
  install -m644 data/*rc "$pkgdir"/usr/share/$pkgname/rc
  install -m644 data/*.{lbm,scl,wav} "$pkgdir"/usr/share/$pkgname
  install -Dm755 sdlscav "$pkgdir"/usr/bin/$pkgname

  # install the pixmap and desktop file
  install -Dm644 data/scav.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
