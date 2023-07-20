# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-llvm-lines
pkgver=0.4.31
pkgrel=1
pkgdesc="Count the number of lines of LLVM IR across all instantiations of a generic function"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/dtolnay/cargo-llvm-lines'
license=('Apache' 'MIT')
depends=(
    cargo
    gcc-libs
    glibc
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('602f06b1bf9520a54642ffdda10c02aa04818e7e24005bd821f577992da88834')

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo test --frozen --all-features

    # since currently the above runs no tests (kept only for future proofing)
    # run cargo llvm-lines on itself
    target/release/cargo-llvm-lines llvm-lines | head -n 8
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
