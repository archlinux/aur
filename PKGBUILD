# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=dsc
pkgver=0.9.0
pkgrel=1
pkgdesc="Docspell command line interface"
arch=('x86_64' 'aarch64')
url="https://github.com/docspell/dsc"
license=('GPL3')
depends=()
optdepends=()
makedepends=('cargo')
# disable link time optimization as that breaks linking of libgit2
options=(!lto)
source=("https://github.com/docspell/dsc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6a5a02c32ef4481828adeef558a3e0ac70f8c31cca3daeb291238b0557220c60ebe3321b318de8760e2bc472d60f2e2784bc9f70a75edf87588d519ca1eba90e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Do not run tests as they need a docspell server
    #cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
