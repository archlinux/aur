# Maintainer: sigurd4 <sigurd dot spangelo at gmail dot com>

pkgname=poengsum
pkgver=0.2.3
pkgrel=1
pkgdesc="Quickly generate a leaderboard for a quiz from your terminal."
url="https://github.com/sigurd4/poengsum"
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=()
makedepends=('rust' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('78d0f8917db048cc79a91f72cd137ea3f6817101136a1c587fc5f2d753d25dbb')
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
