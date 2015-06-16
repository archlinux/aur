# Original Maintainer: Andy Kosela <spear@protect-ya-neck.com>
# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>

pkgname=frotz
pkgver=2.43d
pkgrel=3
pkgdesc="Z-machine interpreter for playing Interactive Fiction games."
arch=(i686 x86_64 arm armv6h)
url="http://frotz.sourceforge.net/"
license=('GPL')
depends=('ncurses')
groups=(inform)
source=(http://downloads.sourceforge.net/project/frotz/frotz/2.43/frotz-2.43d.tar.gz)
md5sums=('6f4211c9180c75214cda1020c7db2629')


build() {
  cd $srcdir/$pkgname-$pkgver

  # Make some configuration changes 
  sed -i 's|OPTS = -O2.*$|#OPTS = -O2|' Makefile 
  sed -i 's|PREFIX = /usr/local.*$|PREFIX = /usr|' Makefile
  sed -i 's|CONFIG_DIR = /usr/local/etc.*$|#CONFIG_DIR = /usr/local/etc|' Makefile   
  sed -i 's|#CONFIG_DIR = /etc.*$|CONFIG_DIR = /etc|' Makefile 
  sed -i 's|#SOUND_DEFS = -DOSS_SOUND.*$|SOUND_DEFS = -DOSS_SOUND|' Makefile 
  sed -i 's|#SOUND_DEV = /dev/dsp.*$|SOUND_DEV = /dev/dsp|' Makefile 
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
