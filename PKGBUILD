# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sdd
pkgver=1.52
pkgrel=8
pkgdesc="Faster replacement for a program called dd"
arch=('x86_64')
license=('GPL')
url="http://freshmeat.net/projects/sdd/"
#source=(ftp://ftp.berlios.de/pub/sdd/sdd-$pkgver.tar.gz
source=(https://arch.p5n.pp.ru/~sergej/dl/2014/sdd-$pkgver.tar.gz
	build-fix.patch)
options=(!emptydirs)
sha256sums=('142b3ec789248ec573eb1f047709c484cc5ae7ac9b49107384cfe4f1ad625d87'
            'f14d16807795ec7150f6ffafd75b331889f17aeb4b254b2d2b3acefbad116b19')

build() {
  cd "$srcdir"/$pkgname-${pkgver}
  if [ $CARCH = "x86_64" ]; then
	cp RULES/i686-linux-cc.rul RULES/x86_64-linux-cc.rul
	cp RULES/i686-linux-gcc.rul RULES/x86_64-linux-gcc.rul
  fi
  patch -p1 <"$srcdir"/build-fix.patch
  make
}

package() {
  cd "$srcdir"/$pkgname-${pkgver}
  make INS_BASE="$pkgdir"/usr install
  mkdir -p "$pkgdir"/usr/share/man
  rm -rf "$pkgdir"/usr/include/ \
	"$pkgdir"/usr/lib/ \
	"$pkgdir"/usr/man/man3/ \
	"$pkgdir"/usr/man/man5/
  mv "$pkgdir"/usr/man/* "$pkgdir"/usr/share/man/
  chown -R root.root "$pkgdir"
}
