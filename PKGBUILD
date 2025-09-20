# Maintainer: willemw <willemw12@gmail.com>
# Contributor: blaise <blaise@gmail.com>

pkgname=xtail
pkgver=2.1
_pkgver=2.1-11
_pkgurl=http://deb.debian.org/debian/pool/main/x/xtail/xtail
pkgrel=1
pkgdesc='Tail multiple logfiles at once, even if rotated'
arch=(x86_64)
#url=https://unicom.crosenthal.com/sw/xtail
url=https://packages.debian.org/stable/xtail
license=(BSD)
source=(
  "$pkgname-$pkgver.tar.gz::${_pkgurl}_$pkgver.orig.tar.gz"
  "${pkgname}_$_pkgver.debian.tar.xz::${_pkgurl}_$_pkgver.debian.tar.xz")
sha256sums=('75184926dffd89e9405769b24f01c8ed3b25d3c4a8eac60271fc5bb11f6c2d53'
            '9d8f501d2a0c0a069d8d109e1c0f7aa32b91bbfe7e204eba60fd9d33dd8dabcf')

prepare() {
  chmod -R +w $pkgname-$pkgver

  local _patchdir="$srcdir/debian/patches"
  while IFS= read -r _file; do
    patch --directory=$pkgname-$pkgver --forward --strip=1 --input="$_patchdir/$_file"
  done <"$_patchdir/series"
}

build() {
  cd $pkgname-$pkgver

  # Patch for "error: too many arguments to function ‘sleep’; expected 0, have 1"
  export CFLAGS="$CFLAGS -std=gnu17"

  autoreconf -v
  ./configure --prefix="$pkgdir/usr/bin" --mandir="$pkgdir/usr/share/man"
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 xtail.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm755 xtail -t "$pkgdir/usr/bin"
}
