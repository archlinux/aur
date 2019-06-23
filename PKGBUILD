# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=locarna
pkgver=1.9.2.2
pkgrel=1
pkgdesc='Global and Local Alignment of RNAs'
arch=('i686' 'x86_64')
url="http://www.bioinf.uni-freiburg.de/Software/LocARNA/"
license=('GPL3')
depends=('viennarna>=2.3.5')
checkdepends=()
source=("https://github.com/s-will/LocARNA/releases/download/v${pkgver}/$pkgname-${pkgver}.tar.gz")
md5sums=('24901cf57d3ef4a615f1f7b886d08eb3')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-dynamic-liblocarna \
    --disable-static \
    --with-vrna=/usr

  make
}

check() {
   cd $srcdir/$pkgname-$pkgver

   make check
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  # cleanup after dirty install ...
  install -d $pkgdir/usr/lib/perl5
  mv $pkgdir/usr/lib/perl $pkgdir/usr/lib/perl5/vendor_perl

  for perlmodule in $pkgdir/usr/bin/*.pm ; do
    mv $perlmodule $pkgdir/usr/lib/perl5/vendor_perl
  done
}
