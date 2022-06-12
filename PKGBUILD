# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=apollo-rover
pkgver=0.7.0
pkgrel=1
pkgdesc="CLI for Apollo's suite of GraphQL developer productivity tools"
arch=('x86_64')
url='https://github.com/apollographql/rover'
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
replaces=('apollo-rover-fed2')
options=('!lto')
install=rover.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e8e271a084123feffac8c0a566402c0323cb7e1ea37f8c740b9fb883f23cad80')

prepare() {
	cd "rover-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd "rover-$pkgver"
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "rover-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "rover-$pkgver"
	install -D "target/release/rover" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
