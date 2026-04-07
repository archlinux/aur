# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx
pkgver=2.19.0
pkgrel=1
pkgdesc="Context Engineering Layer for AI Coding — 28 tools, 90+ shell patterns, temporal AI memory, multi-agent diaries, semantic caching, tree-sitter AST. Reduces AI costs by 60-99%."
arch=('x86_64')
url="https://leanctx.com"
license=('MIT')
makedepends=('cargo' 'gcc')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yvgude/lean-ctx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8fad9bb55cc74a9d39228e32c369da0241a7228532c5f7f4f8b340a52bbf0177')

prepare() {
  cd "$pkgname-$pkgver/rust"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver/rust"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }-C link-arg=-fuse-ld=bfd"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver/rust"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  ./target/release/lean-ctx --version
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "rust/target/release/lean-ctx" "$pkgdir/usr/bin/lean-ctx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
