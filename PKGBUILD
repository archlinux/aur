# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=spl-token-cli
_pkgname="${pkgname%-cli}"
pkgver=2.0.15
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
b2sums=(fa5d089fc0c7bb20670cf0778df28c287e2e924fdced3286b6fec8bd90df7459952dc651a9bbfe81e64eb50cd102b53e7ce7e7cf34437914f622573eb0b8bd0a)

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
