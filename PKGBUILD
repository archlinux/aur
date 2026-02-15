# Maintainer: Rob Cohen <rob@robcohen.dev>
pkgname=rustledger
pkgver=0.8.8
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
sha256sums=('3312b7ecab442844849ed0d618af1e21fc596ee0dd2d024925cc365335e6ea41')

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
