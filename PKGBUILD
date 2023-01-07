# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-show-asm
_binname=cargo-asm
pkgver=0.2.8
pkgrel=1
pkgdesc='Cargo subcommand to display ASM, LLVM-IR and MIR for Rust source code'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/pacak/cargo-show-asm'
license=('Apache' 'MIT')
depends=(
    cargo
    gcc-libs
    glibc
)
provides=($_binname)
conflicts=($_binname)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$url/commit/8677f88deba6f5f943ff2c4ed103331d872ecbe8.patch")
sha256sums=('6498fb8b6f4ae6aad4a1f1e50a7615e41f0171b051247120fc3a02b08cc832e0'
            'e24adbf35edf3aa64bda1e83efdc57b081b130b410f6c06aefc9453ba75b964f')

prepare() {
    cd "$pkgname-$pkgver"

    patch --forward --strip=1 --input="${srcdir}/8677f88deba6f5f943ff2c4ed103331d872ecbe8.patch"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
    export CARGO_TARGET_DIR=target

    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_binname"

    # Skip LICENSE-MIT, upstream does not currently provide it.
    # install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
