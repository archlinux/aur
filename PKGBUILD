# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=libdeltachat
pkgver=1.151.1
pkgrel=1
pkgdesc="Deltachat-core written in Rust"
arch=('x86_64')
url="https://github.com/deltachat/deltachat-core-rust/"
license=('MPL-2.0')
depends=('sqlcipher')
options=(!lto)
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver::https://github.com/deltachat/deltachat-core-rust/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a83947fd0c6c317814e838f035097f012bf7ff441d6337986a78c9e1d414307d4e65e457a48fe3f348b71934940fad755001c2a5b3e46573b868bb5278b6c62e')

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
