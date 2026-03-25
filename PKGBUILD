# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx
pkgver=1.8.2
pkgrel=1
pkgdesc="Hybrid Context Optimizer — reduces LLM token consumption by up to 99%. MCP Server + Shell Hook + 75+ CLI compression patterns + tree-sitter AST (14 languages)."
arch=('x86_64')
url="https://leanctx.com"
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs')
source=("$pkgname-$pkgver.crate::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('ae9c35607e50e15f61b196834928df46bad9493e4cf0e63d01ef32df16f01957')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  ./target/release/lean-ctx --version
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/lean-ctx" "$pkgdir/usr/bin/lean-ctx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
