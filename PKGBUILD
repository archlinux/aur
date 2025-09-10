# Maintainer: Mark Fisher <mark dot fisher at gmail dot com>

pkgname=toolshed-git
basename=${pkgname//-git/}
pkgver=2_4_1.r2.g296e93a
pkgrel=1
pkgdesc="Utilities for Tandy Color Computer and Dragon microcomputers cross-development - git version."
arch=('x86_64')
url="https://github.com/nitros9project/toolshed"
license=('PerlArtistic')
depends=('fuse2')
makedepends=('discount' 'git')
source=("git+https://github.com/nitros9project/toolshed.git")
sha256sums=('SKIP')

pkgver() {
  cd "$basename"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$basename"
  git fetch --tags
}

build() {
  cd "$basename"
  make -C build/unix
}

check() {
  cd "$basename"
  tests/hybrid-dsk.sh
  tests/multihdb-dsk.sh
}

package() {
  cd "$basename"
  make DESTDIR="$pkgdir/" -C build/unix install

  # Install license file
  sed -n '/Copyright/,/PARTICULAR PURPOSE./p' casm/src/util.h >LICENSE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$basename" LICENSE

  # Install image for HTML manual
  install -m644 doc/cover.jpg "$pkgdir/usr/share/doc/$basename/"
}

# vim:set ts=2 sw=2 et:
