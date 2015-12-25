# Contributor: Christian Neukirchen <chneukirchen.org>
pkgname=nn
pkgver=6.7.3
_debver=3
pkgrel=2
pkgdesc="old-school Usenet news reader (with Debian patches, NNTP only)"
arch=(i686 x86_64)
url="http://packages.debian.org/en/sid/news/nn"
license=('custom')
depends=(sh)
makedepends=(gawk)
install=nn.install
source=(http://ftp.de.debian.org/debian/pool/main/n/nn/nn_$pkgver.orig.tar.gz
        http://ftp.de.debian.org/debian/pool/main/n/nn/nn_$pkgver-$_debver.diff.gz
        config.h)
md5sums=('98e9cafed68509b44cf8c8acaf373eff'
         'dc43b524b41eefec497bc0985e6589c2'
         '975dc4bf20bbab47fd9af71026d3ac87')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  zcat "$srcdir/nn_$pkgver-$_debver.diff.gz" | patch -p1
  sed -i "s/^CPP =.*/& -traditional-cpp/" Makefile
  cp -f $srcdir/config.h .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{bin,lib/nn/help,share/man/{man1,man8}}
  DESTDIR="$pkgdir/" ./inst n
  install -D -m644 "${srcdir}/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 debian/nnbatch.1 $pkgdir/usr/share/man/man1/nnbatch.1
  rm -rf $pkgdir/usr/share/man/man8 \
         $pkgdir/usr/share/man/man1/nn*.1m* \
         $pkgdir/usr/bin/{nnadmin,nnstats,nnusage,nnact}
}

# vim:set ts=2 sw=2 et:
