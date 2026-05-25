# Maintainer: sigurd4 <sigurd dot spangelo at gmail dot com>

pkgname=enneagram
pkgver=1.1.0
pkgrel=1
pkgdesc="An exploration into the enneagram."
url="https://github.com/sigurd4/ennegram"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=()
makedepends=('cargo' 'rust' 'base-devel')
provides=('enneagram')
conflicts=('enneagram-git')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('83f63d3a0264960146f8334863982b74b0fdbf70cb2ca2d5f853ec519e9097b1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -- --skip "config"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
