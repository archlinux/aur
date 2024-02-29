# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=tracexec
pkgver=0.0.5
pkgrel=1
pkgdesc="A small utility for tracing execve{,at}"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/kxxt/tracexec"
license=('GPL-2.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('tracexec-bin')
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()
b2sums=('a934637efb5be5a8fa573073ce89f18ec4a83b1ba1c4de52a821045a802d0b30fcd04488035fd02aef13b7527fa050157d5f3f71c384854838ac7db34317c979')

case "$CARCH" in
    riscv64)
        RUST_ARCH=riscv64gc
        _feature_flags="--no-default-features"
        ;;
    *) RUST_ARCH="$CARCH" ;;
esac

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$RUST_ARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release $_feature_flags
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen $_feature_flags
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
