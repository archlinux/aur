# Maintainer: Your Name <your.email@example.com>
pkgname=rust-background-picker
pkgver=0.1.0
pkgrel=1
pkgdesc="A Rust crate for allowing a user to select a background from a directory tree"
arch=('x86_64')
url="https://crates.io/crates/background_picker"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/background-picker/$pkgver/download")
sha256sums=('ff3aac44fcff622653166e6b96dd1d1cb8233c0bc79f74b79a3c578fc0473257')

prepare() {
    cd "$srcdir/background-picker-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/background-picker-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/background-picker-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/background-picker-$pkgver"
    
    # Install binary if it exists
    if [ -f "target/release/background-picker" ]; then
        install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/background-picker"
    fi
    
    # Install library
    install -Dm644 target/release/deps/libbackground_picker-*.rlib -t "$pkgdir/usr/lib/rustlib/$CARCH-unknown-linux-gnu/lib/" 2>/dev/null || true
    
    # Install licenses
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
