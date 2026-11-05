pkgname=baml
pkgver=0.3.0
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

source=("$pkgname-$pkgver.tar.gz::https://github.com/BoundaryML/baml/archive/refs/tags/baml-wrapper-0.3.0.tar.gz")
sha256sums=('e5bc34eb29f88a5089f3a7e1c811f95fcf12d0254a952810e04cf252b29b40ab')

prepare() {
    cd "baml-baml-wrapper-0.3.0/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "baml-baml-wrapper-0.3.0/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # GitHub source archives have no .git metadata; compiler and host must agree.
    export BAML_GIT_SHA=dec4713a0e7c9699442bf5855b4f327063f769c5
    cargo build --release --frozen --bin baml-cli --bin baml-pack-host
    python wrapper/build \
        --cli target/release/baml-cli \
        --pack-host target/release/baml-pack-host \
        --version 0.3.0 \
        --no-self-update \
        --output target/release/baml
}

package() {
    cd "baml-baml-wrapper-0.3.0/baml_language"
    install -Dm755 "target/release/baml" "$pkgdir/usr/bin/baml"
}
