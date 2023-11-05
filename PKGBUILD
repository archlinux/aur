# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=tracexec
pkgver=0.0.3
pkgrel=1
pkgdesc="A small utility for tracing execve{,at}"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/kxxt/tracexec"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('tracexec-bin')
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()
b2sums=('ff41a3695173e97c24c59c08deb75535d431601f5cb956227e7951a7fe608637dd2ce4a659dab68695d192d6107f0a8afd8574ed95337fc7ac5f92342472f7d8')

case "$CARCH" in
    riscv64) RUST_ARCH=riscv64gc ;;
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
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
