# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=libdeltachat
pkgver=2.63.0
pkgrel=1
pkgdesc="Deltachat-core written in Rust"
arch=('x86_64')
url="https://github.com/chatmail/core/"
license=('MPL-2.0')
depends=('sqlcipher')
options=(!lto)
makedepends=('cargo' 'cargo-nextest' 'git')
source=("$pkgname-$pkgver::https://github.com/chatmail/core/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('be13b21b70e5b27838329ab7f47fb61f386f50eb687f2fcc5362bee02b0d66d7bf0a27fb628cc9866f66ccec8b8a349f9fa87914993323e90d1595af8b289fcc')

prepare() {
    cd "$srcdir/core-$pkgver/deltachat-ffi"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "x86_64-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/core-$pkgver/deltachat-ffi"
    cargo build --target-dir "target" --frozen --release --no-default-features --features vendored
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/core-$pkgver/deltachat-ffi"
    cargo nextest run --frozen --no-default-features --features vendored --workspace --exclude deltachat-jsonrpc-bindings
}

package() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/core-$pkgver/deltachat-ffi"
    install -Dm0644 "deltachat.h" "$pkgdir/usr/include/deltachat.h"
    install -Dm0755 "target/release/libdeltachat.a" "$pkgdir/usr/lib/libdeltachat.a"
    install -Dm0755 "target/release/libdeltachat.so" "$pkgdir/usr/lib/libdeltachat.so"
    install -Dm0644 "target/release/pkgconfig/deltachat.pc" "$pkgdir/usr/lib/pkgconfig/deltachat.pc"
}
