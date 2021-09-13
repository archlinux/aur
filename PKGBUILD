# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

_crate="cargo-generate-rpm"
pkgname="$_crate"
pkgver=0.5.0
pkgrel=1
pkgdesc='Cargo helper command to generate a binary RPM package (.rpm) from Cargo project'
license=('Apache')
arch=('aarch64' 'i686' 'x86_64')
url="https://crates.io/crates/$_crate"
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('efb9169df863f7af3b39e994b68b90fe2d55d757bc7ced1d7fd7b0982701efb18488c76a000d6ca009d625cb155dba6a16f2cec71a9265b29446dfabe1d80d55')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR=target
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}