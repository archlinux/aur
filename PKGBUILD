# Maintainer: hafeoz <hafeoz@kolabnow.com>
pkgname=synapse-auto-compressor
reponame=rust-synapse-compress-state
pkgver=0.1.4
pkgrel=1
pkgdesc="A tool to compress some state in a Synapse instance's database"
arch=('x86_64')
url="https://github.com/matrix-org/rust-synapse-compress-state"
license=('Apache-2.0')
depends=()
makedepends=('cargo' 'python3' 'libjemalloc.so' 'git')
source=("$reponame::git+https://github.com/matrix-org/rust-synapse-compress-state.git#tag=v${pkgver}")
options=(!lto)
b2sums=('7b5ea83c873f2f44a5d2306aa046951202aa0c621813c5a06ff1235b3e6fc39f4728cb5be0a00305dd29a17a701be107a7478067bf2a9eddd14507cfb06b57b1')

prepare() {
    cd "$reponame/synapse_auto_compressor"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export JEMALLOC_OVERRIDE=/usr/lib/libjemalloc_pic.a
    export CARGO_FEATURE_UNPREFIXED_MALLOC_ON_SUPPORTED_PLATFORMS=1

    cd "$reponame/synapse_auto_compressor"

    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export JEMALLOC_OVERRIDE=/usr/lib/libjemalloc_pic.a
    export CARGO_FEATURE_UNPREFIXED_MALLOC_ON_SUPPORTED_PLATFORMS=1

    cd "$reponame/synapse_auto_compressor"

    cargo test --frozen --all-features
}

package() {
    cd "$reponame"

    install -Dm755 -t "$pkgdir/usr/bin/" "synapse_auto_compressor/target/release/synapse_auto_compressor"
}
