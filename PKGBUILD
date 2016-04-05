# Maintainer: George Ornbo <george@shapeshed.com>

pkgname=st
pkgver=0.6
pkgrel=3
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxext' 'libxft')
makedepends=('ncurses')
url="http://st.suckless.org"
source=(http://dl.suckless.org/st/$pkgname-$pkgver.tar.gz
        http://st.suckless.org/patches/st-$pkgver-no-bold-colors.diff
        http://st.suckless.org/patches/st-$pkgver-solarized-dark.diff)

md5sums=('1a926f450b4eacb7e2f5ac5b8ffea7c8' 
         '318bffa6a563970754554694107b1ca1'
         'cd75677133a2d6b3111fec5ae1b466bd')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i ../st-$pkgver-no-bold-colors.diff
  patch -p1 -i ../st-$pkgver-solarized-dark.diff
  cp config.def.h config.h
  sed -i 's/Liberation Mono:pixelsize=12:antialias=false:autohint=false/Inconsolata:pixelsize=16:antialias=true:autohint=true/' config.h 
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
