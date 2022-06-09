# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=fsrx
pkgver=1.0.0
pkgrel=1
pkgdesc=" flow state reading in the terminal"
arch=('x86_64')
url="https://github.com/coloradocolby/fsrx"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4085c791ed7830de7923b7cdf5122b61639597cad6481f97d64b3f41d803759acee6092644bf250ea1214136e4eac77d0e00eb4e86545273a813866d3c75236d')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  GEN_COMPLETIONS=1 cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  local OUT_DIR=$(<out_dir)

  install -Dm755 "target/release/fsrx" "$pkgdir/usr/bin/fsrx"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
