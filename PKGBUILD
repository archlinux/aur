# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hotwire-rs
pkgver=0.2.3
pkgrel=1
pkgdesc="GTK application that leverages Wireshark and tshark to capture traffic for analysis"
arch=('x86_64')
url="https://github.com/emmanueltouzery/hotwire"
license=('MIT')
depends=('gtk3' 'tcpdump' 'wireguard-tools')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fbb68b545800cc334292f6f649abcb5fe19c2eeac0853715d54df0c759c711f5')

prepare() {
	cd "hotwire-$pkgver"
	cargo update
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
	install -D target/release/hotwire -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 com.github.emmanueltouzery.hotwire.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 com.github.emmanueltouzery.hotwire.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
