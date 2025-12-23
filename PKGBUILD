# Maintainer: Daniel Fichtinger <daniel at ficd dot ca>
# Maintainer: Dimitri Sabadie <hadronized at strongly-typed-thoughts dot net>
# Contributor: Davide Poderini <davide at poder dot in>

pkgname=kak-tree-sitter
pkgver=3.1.0
_ctlname=ktsctl
_ctlver=3.1.0
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
sha256sums=('c6106d55427617246520854e06f28a224304937ec0d7898f36f674b34c30621c'
            '4365b7e397da87b3a7d58edd8a1b26af5a669e88a2256cd86394782ba71d0280')

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
