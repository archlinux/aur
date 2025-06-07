# Maintainer: Your Name <your.email@example.com>
pkgname=rust-images-matching-subdirectories
pkgver=0.1.0
pkgrel=1
pkgdesc="A Rust crate for matching images in subdirectories"
arch=('x86_64')
url="https://crates.io/crates/images_matching_subdirectories"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/images_matching_subdirectories/$pkgver/download")
sha256sums=('5ed1de2e81a3fa920c0d6ce56b6707f71802747395fad9c3d9dbbe7a8e79fd56')

prepare() {
    cd "$srcdir/images_matching_subdirectories-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/images_matching_subdirectories-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/images_matching_subdirectories-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/images_matching_subdirectories-$pkgver"
    
    # Install binary if it exists
    if [ -f "target/release/images_matching_subdirectories" ]; then
        install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/images_matching_subdirectories"
    fi
    
    # Install library
    install -Dm644 target/release/deps/libimages_matching_subdirectories-*.rlib -t "$pkgdir/usr/lib/rustlib/$CARCH-unknown-linux-gnu/lib/" 2>/dev/null || true
    
    # Install licenses
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
