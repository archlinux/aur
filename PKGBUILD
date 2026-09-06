# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=customasm
pkgver=0.14.1
pkgrel=1
pkgdesc='An assembler for custom, user-defined instruction sets'
arch=('x86_64')
url='https://github.com/hlorenzi/customasm'
license=('Apache-2.0')
depends=(gcc-libs glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('4c03a99d3cb1d74fdc09cbee7d3ee21f2e2379530ae50d25958140f0517f8ed6')

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
