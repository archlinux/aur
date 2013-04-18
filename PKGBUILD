# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=gocr
pkgver=0.50
pkgrel=1
pkgdesc="Open-source character recognition (OCR)"
arch=("i686" "x86_64")
url="http://jocr.sourceforge.net/index.html"
license=('GPL')
depends=('glibc' 'netpbm')
optdepends=('tk: to use the tk frontend')
source=(http://www-e.uni-magdeburg.de/jschulen/ocr/gocr-${pkgver}.tar.gz)
md5sums=('553ea40c2b3a1a0b03a30675d0e0aba1')

build() {
  cd $srcdir/$pkgname-$pkgver
  [ $CARCH == "x86_64" ] && export CFLAGS=-fPIC
  ./configure --prefix=/usr --mandir=/usr/share/man --libdir=/usr/lib
  make -j1 all libs
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/lib
  make DESTDIR=$pkgdir libdir=/usr/lib/ bindir=/usr/bin install
  (cd $pkgdir/usr/lib/ && rm -f libPgm2asc.so && ln -s `echo libPgm2asc*.so` libPgm2asc.so)
  install -D -m644 doc/gocr.html $pkgdir/usr/share/doc/gocr/gocr.html
  for i in pgm2asc.h gocr.h; do
    install -D -m644 src/$i $pkgdir/usr/include/gocr/$i
  done
}
