# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=toolshed
pkgver=2.2
pkgrel=1
pkgdesc="Utilities for Tandy Color Computer and Dragon microcomputers cross-development."
arch=('x86_64')
url="http://toolshed.sourceforge.net"
license=('PerlArtistic')
depends=('fuse2')
makedepends=('discount')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ab7201970e9c13e1cbdb9c8398bd888f870e75e33055b7a308bb039f67614c69')

prepare() {
  cd "$pkgname-$pkgver/build/unix"
  sed -i '/(CC)/ s/$/ $(LDFLAGS)/' ar2/Makefile
  sed -i '/(CC)/ s/$/ $(LDFLAGS)/' makewav/Makefile
}

build() {
  cd "$pkgname-$pkgver"
  make -C build/unix
}

check() {
  cd "$pkgname-$pkgver" 
  tests/hybrid-dsk.sh
  tests/multihdb-dsk.sh
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" -C build/unix install

  # Install license file
  sed -n '/Copyright/,/PARTICULAR PURPOSE./p' casm/src/util.h > LICENSE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  
  # Install image for HTML manual
  install -m644 doc/cover.jpg "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
