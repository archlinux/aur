# Maintainer: Davide Poderini <davide at poder dot in>

pkgname=kak-tree-sitter
pkgver=0.6.0
_ctlname=ktsctl
_ctlver=0.4.0
pkgrel=1
pkgdesc='Server between Kakoune and tree-sitter'
arch=('x86_64')
url="https://git.sr.ht/~hadronized/${pkgname}"
license=('BSD-3-Clause')
depends=('kakoune')
makedepends=('cargo')
options=(!debug !lto)
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate    
    $_ctlname-$_ctlver.tar.gz::https://static.crates.io/crates/$_ctlname/$_ctlname-$_ctlver.crate
    )
sha256sums=('db395a6f5d7a9b2489e7382dd47b23d83f037db124f9cf518c70dfc47633ce62'
    '24e69aa064bc4ee810f285d7b1892a4a74895a4f457e71080fe4266a6bee9611'
    )

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    
    cd "$srcdir/$_ctlname-$_ctlver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    
    printf "\n%s\n" "Building kak-tree-sitter" 
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --frozen --release --all-features
    printf "\n%s\n" "Building ktskctl" 
    cd "$srcdir/$_ctlname-$_ctlver"
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-$pkgver/target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_ctlname-$_ctlver/target/release/$_ctlname"
}
