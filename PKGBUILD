# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

_crate="cargo-generate-rpm"
pkgname="$_crate"
pkgver=0.9.1
pkgrel=1
pkgdesc='Cargo helper command to generate a binary RPM package (.rpm) from Cargo project'
license=('Apache')
arch=('aarch64' 'i686' 'x86_64')
url="https://crates.io/crates/$_crate"
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('2e9588b048b0940051511970710eb2b2fb2d43cdb780c4afc57516e4a0558a94e49d29dc189681baa30a2b0092523357c88c3449536f9b1cbdae0c8c27103132')

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
