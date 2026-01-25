# Maintainer: Martin Stark <martinstark@protonmail.com>
pkgname=ralph
pkgver=0.2.2
pkgrel=1
pkgdesc="Autonomous AI agent loop for Claude Code CLI"
arch=('x86_64')
url="https://github.com/martinstark/ralph-rs"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('19069dc29b5b6a11b88a2981ef6f61c31b485611adcb2f817df6a5f566827326')

prepare() {
    cd "ralph-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "ralph-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "ralph-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "ralph-rs-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/ralph"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
