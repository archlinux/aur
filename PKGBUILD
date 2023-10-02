# Maintainer: e-dong <eric2043@gmail.com>
pkgname=encoder-benchmark-git
pkgver=0.6.0.alpha.r9.gdc9663e
pkgrel=1
epoch=
pkgdesc="A tool to benchmark your hardware's real-time video encoding capabilities."
arch=("x86_64")
url="https://github.com/Proryanator/encoder-benchmark"
license=('GPL3')
groups=()
depends=('ffmpeg' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/Proryanator/encoder-benchmark.git#branch=main")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
