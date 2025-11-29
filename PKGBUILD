# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Saghm Rossi <aur@saghm.com>
pkgname=marmite
pkgver=0.2.6
pkgrel=1
pkgdesc="Markdown makes sites - A Static Site Generator for Blogs "
arch=('x86_64')
license=('AGPL-3.0')
url="https://marmite.blog/"
source=("marmite-$pkgver.tar.gz::https://github.com/rochacbruno/marmite/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('6b98b9f6d56103f46137cafef40cd26b48ec78b5eb6d51a874937ecc15a62e4e889cc6b5fa726f3131561c02d7fb3d5d538c214085ff19f33994f896bb598049')
makedepends=('cargo')

prepare() {
    cd "${srcdir}/marmite-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CC=clang
    export AR=llvm-ar
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "${srcdir}/marmite-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CC=clang
    export AR=llvm-ar
    export CARGO_TARGET_DIR=target
    
    cargo build --frozen --release --all-features
}

package() {
    cd "${srcdir}/marmite-${pkgver}"
    install -Dm755 "target/release/marmite" "${pkgdir}/usr/bin/marmite"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/marmite/LICENSE"
}

check() {
    cd "${srcdir}/marmite-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}