# Maintainer: Your Name <your.email@example.com>
pkgname=rust-name-time-period
pkgver=0.3.1
pkgrel=1
pkgdesc="A Rust crate for handling named time periods"
arch=('x86_64')
url="https://crates.io/crates/name_time_period"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/name_time_period/$pkgver/download")
sha256sums=('96f4602aa0505817ad5f26072f1a3cb4e339edcf3d4d4ccf42c1fc803c683cc5')

prepare() {
    cd "$srcdir/name_time_period-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/name_time_period-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/name_time_period-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/name_time_period-$pkgver"
    
    # Install binary if it exists
    if [ -f "target/release/name_time_period" ]; then
        install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/name_time_period"
    fi
    
    # Install library
    install -Dm644 target/release/deps/libname_time_period-*.rlib -t "$pkgdir/usr/lib/rustlib/$CARCH-unknown-linux-gnu/lib/" 2>/dev/null || true
    
    # Install licenses
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
