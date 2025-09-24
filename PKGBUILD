# Maintainer: Arthur Carcano <arthur.carcano@ocamlpro.com>
pkgname=agnos
pkgver=0.1.1
pkgrel=1
makedepends=('cargo')
depends=('openssl' 'gcc-libs' 'glibc')
arch=('x86_64')
url="https://github.com/krtab/agnos"
pkgdesc="Obtain (wildcard) certificates from let\'s encrypt using dns-01 without the need for API access to your DNS provider."
license=('MIT')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-${pkgver//_/-}.crate")
sha256sums=('fbab0a946a00893e5e7f9fc888edd0469fbf8d486a672a7632917357322ee3b1')
install="INSTALL"
CFLAGS+=' -ffat-lto-objects'

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    mv $pkgname-${pkgver//_/-}/* ./
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Cf https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
    export CFLAGS+=' -ffat-lto-objects'
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
