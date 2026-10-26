# Maintainer: Nikolai Käck <nikolaikack@nikoware.com>

pkgname=mcp-discovery
pkgver=0.3.2
pkgrel=1
pkgdesc="A command-line tool written in Rust for discovering and documenting MCP Server capabilities."
arch=('x86_64')
url="https://github.com/rust-mcp-stack/mcp-discovery"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zstd')
makedepends=('cargo' 'perl' 'pkgconf')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('e1755879d6057d1025bc8db4188088e4a2afc3a08b4c84441428051c3921c6c6')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export ZSTD_SYS_USE_PKG_CONFIG=0
  cargo build --frozen --release --all-targets
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/mcp-discovery" "$pkgdir/usr/bin/mcp-discovery"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
