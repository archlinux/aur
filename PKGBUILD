# Maintainer: nirnakinho <aur at dominikbodi dot de>
pkgname=starsector-mod-manager-rust
pkgver=0.7.2
pkgrel=1
pkgdesc="A mod manager for the game Starsector"
arch=('x86_64')
url="https://atlanticaccent.github.io/starsector-mod-manager-rust/"
license=('MIT')
depends=('webkit2gtk-4.1' 'zenity')
makedepends=('cargo-nightly')
optdepends=('starsector')
source=("$pkgname-$pkgver.tar.gz::https://github.com/atlanticaccent/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "starsector_mod_manager.desktop")
	
b2sums=('d6e1d544fe9dc3b26282db6ee0bdbfabdf464182ce2ab95d54d61e19ed64d987aef0573ad724b8b7d8b35aa2c60416b343736d5a5c375e5a501641d3cddb1591'
        'c60a680930e64e7eec7f0c5d56ce51fac0c7c517a62c9f34771a786c89d56939e1e1429270dad9342c5af73d1932d5c76bd17eb29efc927fe9ebe5aa43917410')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
    
build() {
    cd $pkgname-$pkgver
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

#check() {
#    cd $pkgname-$pkgver
#    cargo test --frozen --workspace --all-features
#}

package() {
  install -Dm644 "starsector_mod_manager.desktop" "$pkgdir/usr/share/applications/starsector_mod_manager.desktop"
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/starsector_mod_manager"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/licenses/${pkgname}/CHANGELOG.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
