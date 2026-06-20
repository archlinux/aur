# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=toolshed
pkgver=2.5.1
pkgrel=1
pkgdesc="Utilities for Tandy Color Computer and Dragon microcomputers cross-development."
arch=('x86_64')
url="https://github.com/nitros9project/toolshed"
license=('LicenseRef-CASM')
depends=('fuse2')
makedepends=('discount' 'git')
source=(
  "git+https://github.com/nitros9project/toolshed.git#tag=v2_4_2"
  "0001-gcc15-build-fix.patch"
  "0002-full-relro.patch")
sha256sums=('b36656b1af034936cf851b2b5bfb6e8bd468149e081e408b0b6e6837a1ff7a2e'
            '4fb6d05295a525bb564cc8627d429bdf14dded1da48eb25f7e1e999686350970'
            '310c8c9dbb524205b0c82621fb6fbb978000aa355655b685ea845c20aa262234')

prepare() {
  cd "$pkgname"
  patch -p1 -i "../0001-gcc15-build-fix.patch"
  patch -p1 -i "../0002-full-relro.patch"
}

build() {
  cd "$pkgname"
  make -C build/unix
}

check() {
  cd "$pkgname"
  tests/hybrid-dsk.sh
  tests/multihdb-dsk.sh
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" -C build/unix install

  # Install license file
  sed -n '/Copyright/,/PARTICULAR PURPOSE./p' casm/src/util.h >LICENSE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Install image for HTML manual
  install -m644 doc/cover.jpg "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
