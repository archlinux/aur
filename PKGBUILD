# Maintainer: Nonantiy <nonantiy1@gmail.com>
pkgname=narwhal
pkgver=2.3.0
pkgrel=1
pkgdesc='TUI database client with a built-in MCP server'
arch=('x86_64' 'aarch64')
url='https://github.com/Nonanti/narwhal'
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('cargo' 'cmake' 'clang')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e48071d1b9b5befebbb50a6d29c56817149b0623618ea6e85600b42c948cc4f7')  # `sha256sum v2.3.0.tar.gz`

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin narwhal
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/narwhal" "$pkgdir/usr/bin/narwhal"
    install -Dm644 "LICENSE-MIT"    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 "README.md"      "$pkgdir/usr/share/doc/$pkgname/README.md"
}
