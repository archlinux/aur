pkgname=baml
pkgver=0.3.1
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

source=("$pkgname-$pkgver.tar.gz::https://github.com/BoundaryML/baml/archive/refs/tags/baml-wrapper-0.3.1.tar.gz")
sha256sums=('9948cd57ed830b200a955119b31fe48753464e7e0d2050105056705d425f74ab')

prepare() {
    cd "baml-baml-wrapper-0.3.1/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "baml-baml-wrapper-0.3.1/baml_language"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # GitHub source archives have no .git metadata; compiler and host must agree.
    export BAML_GIT_SHA=6a3eb3dfb2908bac750ad0e4cd9d6a086a72f211
    cargo build --release --frozen --bin baml-cli --bin baml-pack-host
    python wrapper/build \
        --cli target/release/baml-cli \
        --pack-host target/release/baml-pack-host \
        --version 0.3.1 \
        --no-self-update \
        --output target/release/baml
}

package() {
    cd "baml-baml-wrapper-0.3.1/baml_language"
    install -Dm755 "target/release/baml" "$pkgdir/usr/bin/baml"
}
