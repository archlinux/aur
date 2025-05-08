# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=customasm
pkgver=0.13.10
pkgrel=1
pkgdesc='An assembler for custom, user-defined instruction sets'
arch=('x86_64')
url='https://github.com/hlorenzi/customasm'
license=('Apache-2.0')
depends=(gcc-libs glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('f3b48dbdb6ec8842352fa3586efe4666cae32662c1becccca6f61fc7b5c25288')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
}
