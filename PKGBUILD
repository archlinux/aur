# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=customasm
pkgver=0.13.11
pkgrel=1
pkgdesc='An assembler for custom, user-defined instruction sets'
arch=('x86_64')
url='https://github.com/hlorenzi/customasm'
license=('Apache-2.0')
depends=(gcc-libs glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('3d112ec840b9bd4136e4096f215989d50bab15c50afc90ede50960a4be0d62e1')

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
