# Maintainer: gigamicro <gammamicro@gmail.com>
_pkgname=bc
pkgname=dc-debian
pkgver=1.07.1
pkgrel=4
pkgdesc="Debian's fork of the dc desktop calculator" # mostly for ~/.dcrc lol
arch=('any')
url='https://packages.debian.org/sid/dc'
license=('GPL')
makedepends=(patch)
conflicts=(bc)
source=(
  http://deb.debian.org/debian/pool/main/b/"$_pkgname/${_pkgname}_$pkgver".orig.tar.gz
  http://deb.debian.org/debian/pool/main/b/"$_pkgname/${_pkgname}_$pkgver-$pkgrel".debian.tar.xz
  # http://deb.debian.org/debian/pool/main/b/"$_pkgname/${_pkgname}_$pkgver-$pkgrel".dsc
)
b2sums=(
  dcedc193be5521aa0fa3a19746233ed65bc1fe8ef12e15155341706de6fbeecb6dd7ee4ab11e2d4b3aca2ae7097cce89e389b3573493bbc893e00b4ed3239594
  f3c8dc037bea42f8b4b71b756a37c1cc3e077ca58d12a0989e1b96a044edb244ac696a0de68922ef1305c6dbc55b8b41e67a04bf988108ffdcb98582642388fd
)

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  while read -r f; do
    patch -p1 <"../debian/patches/$f"
  done<../debian/patches/series
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure
  cd "$srcdir/$_pkgname-$pkgver"/lib
  make
  cd "$srcdir/$_pkgname-$pkgver"/dc
  make
}

package() {
  install -m755 -Dt "$pkgdir/usr/bin/" "$srcdir/$_pkgname-$pkgver/dc/dc"
  install -m644 -Dt "$pkgdir/usr/share/man/man1/" "$srcdir/$_pkgname-$pkgver/doc/dc.1"
  install -m644 -Dt "$pkgdir/usr/share/info/" "$srcdir/$_pkgname-$pkgver/doc/dc.info"
}
