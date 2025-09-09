# Maintainer: Frederick Price <fprice@pricemail.ca>
pkgname=markdown_timesheet
pkgver=0.8.0
pkgrel=1
pkgdesc="A tool for processing markdown files to extract and format timesheet data"
arch=('x86_64')
url="https://crates.io/crates/markdown_timesheet"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/markdown_timesheet/$pkgver/download")
sha256sums=('07c2a1db879eb6987ef82eeba4be09295b86322763232f37910b37ea01785bde')

prepare() {
    cd "$srcdir/markdown_timesheet-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/markdown_timesheet-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/markdown_timesheet-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/markdown_timesheet-$pkgver"
    
    # Install binary
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/markdown_timesheet"
    
    # Install licenses
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
