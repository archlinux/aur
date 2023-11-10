# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=tracexec
pkgver=0.0.4
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
b2sums=('ef2b940063c0aa234bf5c4046136a2cfc063dc926f8d55b595ddc640c4e5e3aad45f206cc9acfadae272ae0a7405c697467025bce1a97ba0a7bad39224dcf801')

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
