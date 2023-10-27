# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=tracexec
pkgver=0.0.2
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
b2sums=('6bfc98e343a1f172adae770ef3232082833d545ece8dbf5460306d47ab0ae3da5fa644d59c301e214686442404fc2ece6195b74e4e38d91a3324b9c6918a8d66')

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
