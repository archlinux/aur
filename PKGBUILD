# Maintainer: Arthur Carcano <arthur.carcano@ocamlpro.com>
pkgname=agnos
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
depends=('openssl')
arch=('x86_64')
pkgdesc="Obtain (wildcard) certificates from let\'s encrypt using dns-01 without the need for API access to your DNS provider."
license=('MIT')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-${pkgver//_/-}.crate")
sha256sums=('3cd676fc8d74ca04816cd5b33ba938031beccdaa31a02cee2e8c0bd23e9801a7')
install="INSTALL"
CFLAGS+=' -ffat-lto-objects'

prepare() {
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
}
