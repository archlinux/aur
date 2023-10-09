# Maintainer: e-dong <eric2043@gmail.com>
pkgname=encoder-benchmark
pkgver=0.6.1
pkgrel=1
pkgdesc="A tool to benchmark your hardware's real-time video encoding capabilities."
arch=("x86_64")
url="https://github.com/Proryanator/encoder-benchmark"
license=('GPL3')
depends=('ffmpeg' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=('encoder-benchmark')
conflicts=('encoder-benchmark-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-alpha.tar.gz")
sha256sums=('SKIP')

prepare() {
    ln -s "$(pwd)/$pkgname-$pkgver-alpha" "$(pwd)/$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/benchmark
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/permutor-cli
}

