# Maintainer: rustledger team <rustledger@users.noreply.github.com>
pkgname=rustledger
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting"
arch=('x86_64' 'aarch64')
url="https://github.com/rustledger/rustledger"
license=('GPL-3.0-only')
provides=('rledger-check' 'rledger-format' 'rledger-query' 'rledger-report' 'rledger-doctor' 'rledger-extract' 'rledger-price')
conflicts=('rustledger-bin')
depends=('gcc-libs')
makedepends=('cargo')

_pkgver="${pkgver//_/-}"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rustledger/rustledger/archive/refs/tags/v${_pkgver}.tar.gz")

# Update this checksum when releasing new versions
sha256sums=('336700a0dfc73fa57251b95e7fbb2870c715c7c35265be0aad773cfcfa19875f')

prepare() {
    cd "$pkgname-${_pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-${_pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-${_pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-${_pkgver}"

    # Install main binaries
    install -Dm755 target/release/rledger-check "$pkgdir/usr/bin/rledger-check"
    install -Dm755 target/release/rledger-format "$pkgdir/usr/bin/rledger-format"
    install -Dm755 target/release/rledger-query "$pkgdir/usr/bin/rledger-query"
    install -Dm755 target/release/rledger-report "$pkgdir/usr/bin/rledger-report"
    install -Dm755 target/release/rledger-doctor "$pkgdir/usr/bin/rledger-doctor"
    install -Dm755 target/release/rledger-extract "$pkgdir/usr/bin/rledger-extract"
    install -Dm755 target/release/rledger-price "$pkgdir/usr/bin/rledger-price"

    # Install bean-* compatibility binaries
    install -Dm755 target/release/bean-check "$pkgdir/usr/bin/bean-check"
    install -Dm755 target/release/bean-format "$pkgdir/usr/bin/bean-format"
    install -Dm755 target/release/bean-query "$pkgdir/usr/bin/bean-query"
    install -Dm755 target/release/bean-report "$pkgdir/usr/bin/bean-report"
    install -Dm755 target/release/bean-doctor "$pkgdir/usr/bin/bean-doctor"
    install -Dm755 target/release/bean-extract "$pkgdir/usr/bin/bean-extract"
    install -Dm755 target/release/bean-price "$pkgdir/usr/bin/bean-price"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
