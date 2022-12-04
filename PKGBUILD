# Maintainer: hafeoz <hafeoz@kolabnow.com>
pkgname=synapse_auto_compressor
_pkgname=rust-synapse-compress-state
pkgver=0.1.3
pkgrel=1
pkgdesc="A tool to compress some state in a Synapse instance's database"
arch=('x86_64')
url="https://github.com/matrix-org/rust-synapse-compress-state"
license=('Apache-2.0')
depends=()
makedepends=('cargo' 'python3' 'libjemalloc.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/matrix-org/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c80f6a56cfcd85a95d2712d62a806d7beee4e03b40467e4522261ee5a42664df43a77b605b5187e5ebc0b3aa4f50d67bb494031b5243493ce471a0534dd140e7')

prepare() {
    cd "$_pkgname-$pkgver/synapse_auto_compressor"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$_pkgname-$pkgver/synapse_auto_compressor"

    export JEMALLOC_OVERRIDE=/usr/lib/libjemalloc_pic.a
    export CARGO_FEATURE_UNPREFIXED_MALLOC_ON_SUPPORTED_PLATFORMS=1
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$_pkgname-$pkgver/synapse_auto_compressor"

    export JEMALLOC_OVERRIDE=/usr/lib/libjemalloc_pic.a
    export CARGO_FEATURE_UNPREFIXED_MALLOC_ON_SUPPORTED_PLATFORMS=1
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname-$pkgver"

    install -Dm755 -t "$pkgdir/usr/bin/" "synapse_auto_compressor/target/release/synapse_auto_compressor"
}
