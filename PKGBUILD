# Original Maintainer: Andy Kosela <spear@protect-ya-neck.com>
# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>

pkgname=frotz
pkgver=2.44
pkgrel=1
pkgdesc="Z-machine interpreter for playing Interactive Fiction games."
arch=(i686 x86_64 arm armv6h)
url="http://frotz.sourceforge.net/"
license=('GPL')
depends=('ncurses')
groups=(inform)
source=(https://github.com/DavidGriffith/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('dbb5eb3bc95275dcb984c4bdbaea58bc1f1b085b20092ce6e86d9f0bf3ba858f')

build() {
  cd $srcdir/$pkgname-$pkgver

  # Make some configuration changes 
  sed -i 's|OPTS = -O2.*$|#OPTS = -O2|' Makefile 
  sed -i 's|PREFIX = /usr/local.*$|PREFIX = /usr|' Makefile
  sed -i 's|CONFIG_DIR = /usr/local/etc.*$|#CONFIG_DIR = /usr/local/etc|' Makefile   
  sed -i 's|#CONFIG_DIR = /etc.*$|CONFIG_DIR = /etc|' Makefile 
  sed -i 's|CURSES = -lcurses.*$|#CURSES = -lcurses|' Makefile 
  sed -i 's|#CURSES = -lncurses.*$|CURSES = -lncurses|' Makefile  
  sed -i 's|#CURSES_DEF = -DUSE_NCURSES_H.*$|CURSES_DEF = -DUSE_NCURSES_H|' Makefile  
  sed -i 's|getline|getaline|' src/dumb/dumb_input.c

  make || return 1
  make dumb || return 1
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man
  mkdir -p $pkgdir/etc
  install -Dm755 $srcdir/$pkgname-$pkgver/frotz $pkgdir/usr/bin/frotz
  install -Dm755 $srcdir/$pkgname-$pkgver/dfrotz $pkgdir/usr/bin/dfrotz
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/frotz.6 $pkgdir/usr/share/man/frotz.6
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/frotz.conf-big $pkgdir/etc/frotz.conf
}
