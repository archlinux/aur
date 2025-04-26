# Maintainer: sigurd4 <sigurd dot spangelo at gmail dot com>

pkgname=poengsum
pkgver=0.1.1
pkgrel=1
pkgdesc="Quickly generate a leaderboard for a quiz in the terminal."
url="https://github.com/sigurd4/poengsum"
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=()
makedepends=('cargo' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('78461346367de222a56b2dece6906609b3d891a88b4e2a2bdc8503dda00d5659')
options=(!lto)

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen -- --skip "config"
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}