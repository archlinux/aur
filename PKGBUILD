# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hotwire-rs
pkgver=0.1.0
pkgrel=2
pkgdesc="A GTK application that leverages Wireshark and tshark to capture traffic for analysis"
arch=('x86_64')
url="https://github.com/emmanueltouzery/hotwire"
license=('MIT')
depends=('gtk3' 'tcpdump' 'wireguard-tools')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0604ee2dcbe46764bfee24ba81995cb84f33db2980f27d1979d583f5b2a1c31d')

prepare() {
	cd "hotwire-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd "hotwire-$pkgver"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable

	cd "hotwire-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "hotwire-$pkgver"
	install -Dm 755 target/release/hotwire -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
