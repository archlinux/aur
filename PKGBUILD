# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=evtx
pkgver=0.8.0
pkgrel=1
pkgdesc="Cross-platform parser for Windows XML EventLog Format"
arch=('x86_64')
url="https://github.com/omerbenamram/evtx"
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('cargo')
changelog=CHANGELOG.md
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('910c6062696c8748256d6afc90983ef802026e291a241f376e1bd74352218620')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	## must be --locked because not all dependencies are downloaded at this point
	cargo build --locked --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -D target/release/evtx_dump -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
