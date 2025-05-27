# Maintainer: Daniel Fichtinger <daniel at ficd dot ca>
# Maintainer: Dimitri Sabadie <hadronized at strongly-typed-thoughts dot net>
# Contributor: Davide Poderini <davide at poder dot in>

pkgname=kak-tree-sitter
pkgver=2.0.0
_ctlname=ktsctl
_ctlver=2.0.0
pkgrel=1
pkgdesc='tree-sitter meets Kakoune '
arch=('x86_64')
url="https://git.sr.ht/~hadronized/kak-tree-sitter"
license=('BSD-3-Clause')
depends=('kakoune')
makedepends=('cargo')
options=(!debug !lto)
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate    
    $_ctlname-$_ctlver.tar.gz::https://static.crates.io/crates/$_ctlname/$_ctlname-$_ctlver.crate
    )
sha256sums=('823e3f89709e4478eee362c385c036253a1e913156dcdde6934690eabaa3b14e'
            'ac5af7e26e0b590ba26ffda128faf9a811917425832063773ffbc2b5e1bc9be9'
            )

prepare() {
    export RUSTUP_TOOLCHAIN=1.86.0
    
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    
    cd "$srcdir/$_ctlname-$_ctlver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=1.86.0
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
    install -D "$srcdir/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.kak-tree-sitter"
    install -D "$srcdir/$_ctlname-$_ctlver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.ktsctl"
}
