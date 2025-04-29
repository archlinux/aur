# Maintainer: sigurd4 <sigurd dot spangelo at gmail dot com>

pkgname=poengsum
pkgver=0.2.1
pkgrel=1
pkgdesc="Quickly generate a leaderboard for a quiz from your terminal."
url="https://github.com/sigurd4/poengsum"
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=()
makedepends=('cargo' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('5c221fa17eee6f3a34e4f9707091ea495bd408c4c6d0f5ac1f51f136368998e9')
options=(!lto)

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo test --frozen -- --skip "config"
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
