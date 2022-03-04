# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=qodem
pkgver=1.0.1
pkgrel=1
pkgdesc="A re-implementation of the DOS-era Qmodem serial communications package."
arch=('i686' 'x86_64')
url="http://qodem.sourceforge.net/"
license=('GPL')
#depends=('ncurses' 'libx11')
depends=('ncurses')
#makedepends=('sdl')
#optdepends=('sdl')
source=("http://downloads.sourceforge.net/project/qodem/qodem/$pkgver/qodem-$pkgver.tar.gz")
md5sums=('8a468f131b0332ceb1cc809ce000701d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # missing ncurses wide header?
  sed -i 's|ncursesw/||' configure
  sed -i 's|ncursesw/||' configure.ac
  sed -i 's|ncursesw/||' source/qcurses.h

  # something needs to be changed to get cryptlib to build?
  #sed -i 's|bn/bn_lcl.h|bn_lcl.h|' lib/cryptlib/bn/bn_add.c

  #sed -i 's|curspriv.h|xcurses/&|' lib/pdcurses/pdcurses/addch.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --disable-ssh --disable-upnp #--enable-x11

  # no reason to hard code versions
  sed -i 's|aclocal-1.14|aclocal|' Makefile
  sed -i 's|automake-1.14|automake|' Makefile

  make PREFIX=/usr CFLAGS='-lm'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # okay, it ignores prefix
  cd "$pkgdir"
  mv usr/local/bin usr/bin
  mv usr/local/share usr/share
  rmdir usr/local
}

