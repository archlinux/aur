# Maintainer: Daniel Fichtinger <daniel at ficd dot ca>
# Maintainer: Dimitri Sabadie <hadronized at strongly-typed-thoughts dot net>
# Contributor: Davide Poderini <davide at poder dot in>

pkgname=kak-tree-sitter
pkgver=3.2.1
_ctlname=ktsctl
_ctlver=3.1.2
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
    $_ctlname-$_ctlver.tar.gz::https://static.crates.io/crates/$_ctlname/$_ctlname-$_ctlver.crate)
sha256sums=('203bd8a9a2088c6b19887945ee4b184e0e45a10f0b6ee8115caba8b57edd2313'
            '4515d62d02b411ffd83ce1c8c095bdd7be904a00c301822b84db16660650ee7e')

prepare() {
    export RUSTUP_TOOLCHAIN=1.86.0
    
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    
    cd "$srcdir/$_ctlname-$_ctlver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=1.88.0
    export CARGO_TARGET_DIR=target
    
    printf "\n%s\n" "Building kak-tree-sitter" 
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --frozen --release --all-features
    printf "\n%s\n" "Building ktsctl" 
    cd "$srcdir/$_ctlname-$_ctlver"
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-$pkgver/target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_ctlname-$_ctlver/target/release/$_ctlname"
    install -D "$srcdir/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.kak-tree-sitter"
    install -D "$srcdir/$_ctlname-$_ctlver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.ktsctl"
}
