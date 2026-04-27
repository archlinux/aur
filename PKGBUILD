# Maintainer: TokenMix <hello@tokenmix.ai>
pkgname=tokenmix-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for TokenMix - one API key for GPT-5, Claude, Gemini, DeepSeek and 155+ LLMs"
arch=("x86_64")
url="https://tokenmix.ai"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=("3190e67adfb165438a94bf470ecdbadf71a77cdb4a419661669f3c4fba4cd6bd")

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n "s/host: //p")"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tokenmix"
    if [ -f LICENSE ]; then
        install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
