# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=locarna
pkgver=1.8.1
pkgrel=1
pkgdesc='Global and Local Alignment of RNAs'
arch=('i686' 'x86_64')
url="http://www.bioinf.uni-freiburg.de/Software/LocARNA/"
license=('GPL3')
depends=('viennarna2>=2.1.1')
checkdepends=()
source=("http://www.bioinf.uni-freiburg.de/Software/LocARNA/Releases/$pkgname-$pkgver.tar.gz")
md5sums=('56c05712498523e36980cec78d06863b')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr \
              --disable-static \
              --with-vrna=/usr \
              --enable-librna

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
  for perlscript in $pkgdir/usr/bin/*.pl ; do
    mv $perlscript $pkgdir/usr/bin/$(basename $perlscript .pl)
  done

  install -d $pkgdir/usr/lib/perl5
  mv $pkgdir/usr/lib/perl $pkgdir/usr/lib/perl5/vendor_perl

  for perlmodule in $pkgdir/usr/bin/*.pm ; do
    mv $perlmodule $pkgdir/usr/lib/perl5/vendor_perl
  done
}
