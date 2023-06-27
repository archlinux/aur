# Maintainer: willemw <willemw12@gmail.com>
# Contributor: blaise <blaise@gmail.com>

pkgname=xtail
pkgver=2.1.9
_pkgver=2.1
_pkgver_debian=2.1-9
pkgrel=1
pkgdesc='Tail multiple logfiles at once, even if rotated'
arch=(x86_64)
url=https://unicom.crosenthal.com/sw/xtail
license=(BSD)
source=("$pkgname-$pkgver.tar.gz::http://deb.debian.org/debian/pool/main/x/xtail/xtail_$_pkgver.orig.tar.gz"
        "${pkgname}_$_pkgver_debian.debian.tar.xz::http://deb.debian.org/debian/pool/main/x/xtail/xtail_$_pkgver_debian.debian.tar.xz")
sha256sums=('75184926dffd89e9405769b24f01c8ed3b25d3c4a8eac60271fc5bb11f6c2d53'
            '4f8c80b0888b3aefdfdec1bf238e0570be74fc43283c34f92becbab625a74b79')

prepare() {
  chmod -R +w $pkgname-$_pkgver

  local _patchdir="$srcdir/debian/patches"
  while IFS= read -r _file; do
    patch --directory=$pkgname-$_pkgver --forward --strip=1 --input="$_patchdir/$_file"
  done <"$_patchdir/series"
}

build() {
  cd $pkgname-$_pkgver
  autoreconf -v
  ./configure --prefix="$pkgdir/usr/bin" --mandir="$pkgdir/usr/share/man"
  make
}

package() {
  cd $pkgname-$_pkgver
  install -Dm644 README  -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 xtail.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm755 xtail   -t "$pkgdir/usr/bin"
}
