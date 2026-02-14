# Maintainer: Rob Cohen <rob@robcohen.dev>
pkgname=rustledger
pkgver=0.8.7
pkgrel=1
pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting"
arch=('x86_64' 'aarch64')
url="https://github.com/rustledger/rustledger"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo' 'rust>=1.89')
provides=('rledger')
conflicts=('rustledger-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rustledger/rustledger/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('660e364f6435c19b78f9c7a01e8c32a634d16b3a75adb7f12b7d6e5238dbf070')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --workspace
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --release --locked --workspace
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install main binaries
    install -Dm755 "target/release/rledger" "$pkgdir/usr/bin/rledger"
    install -Dm755 "target/release/rledger-lsp" "$pkgdir/usr/bin/rledger-lsp"

    # Install beancount compatibility binaries
    for bin in bean-check bean-format bean-query bean-report bean-doctor bean-extract bean-price; do
        if [[ -f "target/release/$bin" ]]; then
            install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
        fi
    done

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
