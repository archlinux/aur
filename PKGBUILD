# Maintainer: metaneutrons <https://github.com/metaneutrons>
pkgname=devserial
pkgver=0.1.3
pkgrel=1
pkgdesc="MCP server bridging serial hardware to LLMs via SQLite-backed buffer"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/devserial-mcp"
license=('GPL-3.0-only')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/metaneutrons/devserial-mcp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "devserial-mcp-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "devserial-mcp-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features esp
}

check() {
    cd "devserial-mcp-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "devserial-mcp-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
