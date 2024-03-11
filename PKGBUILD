# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Philipp Classen <philipp dot classen at posteo dot de>
# Original maintainer: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Jose Neder <jlneder(at)gmail(dot)com>

pkgname=libhugetlbfs
pkgver=2.24
pkgrel=1
pkgdesc='A library which provides easy access to huge pages of memory'
url='https://github.com/libhugetlbfs/libhugetlbfs'
arch=(i686 x86_64)
depends=(perl)
checkdepends=(python)
license=(LGPL2.1)
source=(https://github.com/libhugetlbfs/libhugetlbfs/releases/download/$pkgver/libhugetlbfs-$pkgver.tar.gz)
sha256sums=('d501dfa91c8ead1106967a3d3829f2ba738c3fac0a65cb358ed2ab3870ddc5ef')

_options='BUILDTYPE=NATIVEONLY'
if [ "$CARCH" = "x86_64" ]; then
  _options="$_options LIB32= LIB64=lib"
else
  _options="$_options LIB32=lib LIB64="
fi

prepare() {
  cd $srcdir/libhugetlbfs-$pkgver
  sed 's|/lib64/perl5/TLBC|/lib/perl5/TLBC|g;s|/lib/perl5/TLBC|/lib/perl5/vendor_perl/TLBC|g' -i Makefile
}

build() {
  cd $srcdir/libhugetlbfs-$pkgver
  make $_options PREFIX=/usr
}

check() {
  cd $srcdir/libhugetlbfs-$pkgver
  make $_options check || true
}

package() {
  cd $srcdir/libhugetlbfs-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install $_options
}
