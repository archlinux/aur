# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=dsc
pkgver=0.6.1
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
sha512sums=('f76ea0db044f2ea95f71ab5b0edcb14776ae41723267daeaf47ce3760d549ce1c69574c253e1a54d105beb38eeb67e06fabdad758f98389c00c7cedef59d5058')

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
