# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-show-asm
_binname=cargo-asm
pkgver=0.2.3
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2095905557d49f130ebe6b520a816bfe12ebd447cb837fdba4d8874df7103fa2')

prepare() {
    cd "$pkgname-$pkgver"

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
