# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>
#
# This package tracks the `halley-lift` command-palette binary only, sourced from
# the Halley monorepo via Lift-specific release tags (`halley-lift-v$pkgver`).
# It is intentionally decoupled from the main Halley compositor release tags
# (`v*`), so installing/updating this package will NOT pull or reinstall the
# compositor. The package only changes when you bump `pkgver`/`pkgrel` here.

pkgname=halley-lift
pkgver=0.1.0
pkgrel=1
pkgdesc="Search and action launcher for the Halley Wayland compositor"
arch=('x86_64')
url="https://github.com/saltnpepper97/halley"
license=('GPL-3.0-only')
depends=('wayland' 'libxkbcommon')
makedepends=('cargo' 'rust' 'pkgconf')
optdepends=('halley: the Halley compositor this launcher controls via IPC')
options=('!debug')
# The Lift release tag inside the Halley repo. Bump together with pkgver.
_tag="halley-lift-v$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('8ccdadec46b925c52d08eaeca678103cce1e6973762325bc5d19435dbe47d1bc')

# GitHub tag archives extract to "<repo>-<tag>" -> "halley-halley-lift-v$pkgver"
_srcdir="halley-$_tag"

build() {
  cd "$srcdir/$_srcdir"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p halley-lift
}

package() {
  cd "$srcdir/$_srcdir"

  install -Dm755 "target/release/halley-lift" \
    "$pkgdir/usr/bin/halley-lift"

  install -Dm644 "crates/halley-lift/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "examples/lift.rune" \
    "$pkgdir/usr/share/doc/$pkgname/lift.rune"

  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
