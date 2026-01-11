# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=locarna
pkgver=2.0.1
pkgrel=1
pkgdesc='Global and Local Alignment of RNAs'
arch=('i686' 'x86_64')
url="https://s-will.github.io/LocARNA/"
license=('GPL3')
depends=('viennarna>=2.4.0')
checkdepends=()
source=("https://github.com/s-will/LocARNA/releases/download/v${pkgver}/$pkgname-${pkgver}.tar.gz"
        "disable_tcoffee_dependent_check.patch")
sha256sums=('1f50748d2f8f4bf5888394154d366e0eed8d4e20a3cd0da8b33e200aa1d9edf7'
            '67e03a540a05b425c04a1b5f00290b0b43376a145982cacb85c815c313fea283')

build() {
  cd $srcdir/$pkgname-$pkgver

  patch -p0 -i ../disable_tcoffee_dependent_check.patch

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
