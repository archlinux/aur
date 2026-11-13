pkgname=baml
pkgver=0.4.0
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
# Stripping destroys the packed payload. Cargo owns optimization/debug settings;
# Arch's GCC LTO objects cannot be linked by Rust's LLVM linker.
options=('!strip' '!lto' '!debug')
makedepends=('rust' 'cargo' 'cmake' 'gcc' 'python')
provides=('baml')
conflicts=('baml-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/BoundaryML/baml/archive/refs/tags/baml-wrapper-0.4.0.tar.gz")
sha256sums=('7c556f8435d6c75373fc32d06644e4f804a2fe87a40926218477e99a91d0107f')

prepare() {
    cd "baml-baml-wrapper-0.4.0/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "baml-baml-wrapper-0.4.0/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # GitHub source archives have no .git metadata; compiler and host must agree.
    export BAML_GIT_SHA=6ed97b824d577518cbdc4bc644d1f5c233e77a45
    cargo build --release --frozen --bin baml-cli --bin baml-pack-host
    python wrapper/build \
        --cli target/release/baml-cli \
        --pack-host target/release/baml-pack-host \
        --version 0.4.0 \
        --no-self-update \
        --output target/release/baml
}

package() {
    cd "baml-baml-wrapper-0.4.0/baml_language"
    install -Dm755 "target/release/baml" "$pkgdir/usr/bin/baml"
}
