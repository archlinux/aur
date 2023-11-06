# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=swaysome
pkgdesc="AwesomeWM-like workspaces for sway."
pkgver=2.0.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://gitlab.com/hyask/swaysome"
license=('MIT')
makedepends=(
  'cargo'
)

source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
)

sha256sums=(
  "5c0a0a8210a1455555c6eed5b36b4c1a539e78a01bcaa0402a32d7b03f26b0ab"
)

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
