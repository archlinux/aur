# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=dsc
pkgver=0.8.0
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
sha512sums=('1ad062aaad3f9ddd8e41c5ca221ad6a2d24b21792a54c395204ecb77c31150953c3fc1a9219565dea1d8cf362f774d99dcf967eb27090bdf9cb9a46c712747e5')

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
