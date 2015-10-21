# Maintainer: Tatsunori Aoki <ginjiro.135 at gmail.com>
# Contributor: Brandon Coffman <bkcoffma@gmail.com>

pkgname=dwm-xft
pkgver=6.0
pkgrel=2
pkgdesc='A dynamic window manager for X with Xft support'
url='http://dwm.suckless.org'
arch=(i686 x86_64)
license=(MIT)
options=(zipman)
depends=(libx11 libxinerama libxft)
conflicts=(dwm)
provides=(dwm)
install=dwm.install
source=(http://dl.suckless.org/dwm/dwm-$pkgver.tar.gz
	config.h
	dwm.desktop
        dwm-$pkgver-xft.diff)
md5sums=('8bb00d4142259beb11e13473b81c0857'
         '61caf25a4c1a3d264c150bb14c746f46'
         '939f403a71b6e85261d09fc3412269ee'
         '01d898c9759c702245a4359916810862')

build() {
  cd $srcdir/dwm-$pkgver
  patch -Np1 -i $srcdir/dwm-$pkgver-xft.diff
  cp $srcdir/config.h config.h
  sed -i 's/CPPFLAGS =/CPPFLAGS +=/g' config.mk
  sed -i 's/^CFLAGS = -g/#CFLAGS += -g/g' config.mk
  sed -i 's/^#CFLAGS = -std/CFLAGS += -std/g' config.mk
  sed -i 's/^LDFLAGS = -g/#LDFLAGS += -g/g' config.mk
  sed -i 's/^#LDFLAGS = -s/LDFLAGS += -s/g' config.mk
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/dwm-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
  install -m644 -D $srcdir/dwm.desktop $pkgdir/usr/share/xsessions/dwm.desktop
}
