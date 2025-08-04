# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=libdeltachat
pkgver=2.9.0
pkgrel=1
pkgdesc="Deltachat-core written in Rust"
arch=('x86_64')
url="https://github.com/deltachat/deltachat-core-rust/"
license=('MPL-2.0')
depends=('sqlcipher')
options=(!lto)
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver::https://github.com/deltachat/deltachat-core-rust/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7aed9eebfeee8c8cf865120c6359176a9fc2ef410e1858699ca6482c6bd6ca0fa736d48767cfda5a2c9ccd04910861c17cc31f0078145a9252eea1406bea77d1')

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
    cargo test --frozen --no-default-features --features vendored --workspace -- --test-threads 1 # needed due to a false-positive in tests
}

package() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/core-$pkgver/deltachat-ffi"
    install -Dm0644 "deltachat.h" "$pkgdir/usr/include/deltachat.h"
    install -Dm0755 "target/release/libdeltachat.a" "$pkgdir/usr/lib/libdeltachat.a"
    install -Dm0755 "target/release/libdeltachat.so" "$pkgdir/usr/lib/libdeltachat.so"
    install -Dm0644 "target/release/pkgconfig/deltachat.pc" "$pkgdir/usr/lib/pkgconfig/deltachat.pc"
}
