# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=spl-token-cli
_pkgname="${pkgname%-cli}"
pkgver=2.0.14
pkgrel=1
pkgdesc='Command line utility for creating and using tokens on the Solana blockchain'
arch=(
	'i686'
	'x86_64'
)
url='https://spl.solana.com'
license=('Apache')
makedepends=(
	'cargo'
	'pkgconf'
)
provides=("$_pkgname")
conflicts=(
	"$pkgname-bin"
	"$pkgname-git"
)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=(537e3955e953a44aaab85f79b8cf169eb6fb4f132ccce201d798699f85bb2bb136da3f71115973c3c85d797fb78829ce0407bcdb8cc48face19d9f3b6f916e1f)

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='target'
	cargo build --release --frozen --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN='stable'
	cargo test --release --frozen
}

package() {
	install -Dm 755 "$pkgname-$pkgver/target/release/$_pkgname" -t "$pkgdir/usr/bin"
}
