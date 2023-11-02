# Maintainer: e-dong <eric2043@gmail.com>
# Maintainer: Proryanator <proryanator@gmail.com>
pkgname=encoder-benchmark-git
pkgver=0.6.1.alpha.r3.g8a46f7d
pkgrel=1
pkgdesc="A tool to benchmark your hardware's real-time video encoding capabilities."
arch=("x86_64")
url="https://github.com/Proryanator/encoder-benchmark"
license=('GPL3')
depends=('ffmpeg' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=('encoder-benchmark')
conflicts=('encoder-benchmark')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd encoder-benchmark
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd encoder-benchmark
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd encoder-benchmark
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-features
}

check() {
    cd encoder-benchmark
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd encoder-benchmark
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/benchmark
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/permutor-cli
}

