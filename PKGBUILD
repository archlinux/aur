# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=libdeltachat
pkgver=1.145.0
pkgrel=1
pkgdesc="Deltachat-core written in Rust"
arch=('x86_64')
url="https://github.com/deltachat/deltachat-core-rust/"
license=('MPL-2.0')
depends=('sqlcipher')
options=(!lto)
makedepends=('cargo')
source=("$pkgname-$pkgver::https://github.com/deltachat/deltachat-core-rust/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('fa2f3cc811fac675901c64f5fc8a4d81b95abb1715a11237a5e810dcb02345ed69402b2fb4fb687726384a0eaf00d875744c6b154d1c92c3e91761e676904b08')

prepare() {
    cd "$srcdir/deltachat-core-rust-$pkgver/deltachat-ffi"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "x86_64-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/deltachat-core-rust-$pkgver/deltachat-ffi"
    cargo build --target-dir "target" --frozen --release --no-default-features --features jsonrpc
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/deltachat-core-rust-$pkgver/deltachat-ffi"
    cargo test --frozen --no-default-features --features jsonrpc --workspace -- --test-threads 1 # needed due to a false-positive in tests
}

package() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/deltachat-core-rust-$pkgver/deltachat-ffi"
    install -Dm0644 "deltachat.h" "$pkgdir/usr/include/deltachat.h"
    install -Dm0755 "target/release/libdeltachat.a" "$pkgdir/usr/lib/libdeltachat.a"
    install -Dm0755 "target/release/libdeltachat.so" "$pkgdir/usr/lib/libdeltachat.so"
    install -Dm0644 "target/release/pkgconfig/deltachat.pc" "$pkgdir/usr/lib/pkgconfig/deltachat.pc"
}
