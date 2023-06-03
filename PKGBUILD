# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=dsc
pkgver=0.10.0
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
sha512sums=('fc326a5fb8c2c93da366727a060746945a011fd80b6c5b93776e691425fe7218f5122bd3fc0e046988033bcfb8891e20642ad3cf0671c58bc7d9eac6bdb608e3')

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
