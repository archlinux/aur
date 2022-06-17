# Maintainer: Florian Walsh

pkgname=cocoalib
pkgver=0.99800
pkgrel=3
pkgdesc="A C++ library for doing Computations in Commutative Algebra. Also includes the CoCoA-5 Interpreter."
arch=('i686' 'x86_64')
url="http://cocoa.dima.unige.it/"
license=('GPL')
depends=('gmp' 'boost-libs' 'readline')
makedepends=('frobby' 'boost')
options=('!buildflags')
source=("http://cocoa.dima.unige.it/cocoa/cocoalib/tgz/CoCoALib-$pkgver.tgz" "cocoa5")
sha256sums=('f8bb227e2e1729e171cf7ac2008af71df25914607712c35db7bcb5a044a928c6'
            '77728fcb4204616b77f05fa7801a3a34520ce892decbeb1d588ad9bb6a436a0e')

build() {
  cd "$srcdir/CoCoALib-$pkgver"
  ./configure --with-libfrobby='/usr/lib/libfrobby.a'
  make -s library
  cd src/CoCoA-5
  make -s cocoa5
}

package() {
  cd "$srcdir/CoCoALib-$pkgver"
  install -d "$pkgdir/usr/include/CoCoA"
  for file in include/CoCoA/*.H; do
      install "$file" "$pkgdir/usr/$file"
  done
  install -d "$pkgdir/usr/lib"
  install -m 644 lib/libcocoa.a "$pkgdir/usr/lib/libcocoa.a"
  install -d "$pkgdir/usr/lib/CoCoA/bin"
  install src/CoCoA-5/CoCoAInterpreter "$pkgdir/usr/lib/CoCoA/bin/CoCoAInterpreter"
  install -d "$pkgdir/usr/lib/CoCoA/packages"
  for file in src/CoCoA-5/packages/*; do
      install "$file" "$pkgdir/usr/lib/CoCoA/packages"
  done
  install -d "$pkgdir/usr/lib/CoCoA/CoCoAManual"
  install src/CoCoA-5/CoCoAManual/CoCoAHelp.xml "$pkgdir/usr/lib/CoCoA/CoCoAManual/CoCoAHelp.xml"
  install -d "$pkgdir/usr/lib/CoCoA/examples"
  for file in examples/*; do
      install "$file" "$pkgdir/usr/lib/CoCoA/examples"
  done
  install -d "$pkgdir/usr/lib/CoCoA/doc"
  for file in doc/*.html; do
      install "$file" "$pkgdir/usr/lib/CoCoA/doc"
  done
  install -d "$pkgdir/usr/lib/CoCoA/doc/html"
  for file in doc/html/*.html; do
      install "$file" "$pkgdir/usr/lib/CoCoA/doc/html"
  done
  install "doc/CoCoALib.pdf" "$pkgdir/usr/lib/CoCoA/doc"
  install "doc/COPYING" "$pkgdir/usr/lib/CoCoA/doc"
  install -d "$pkgdir/usr/bin"
  install ../cocoa5 "$pkgdir/usr/bin/cocoa5"
}
