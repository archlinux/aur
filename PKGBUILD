# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=evtx
pkgver=0.8.1
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
sha256sums=('a42133deecbe47ade28e14ed55e4e87a2c9b5d9400867eacec8b32070a2cd95e')

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
	cargo test --frozen --all-features || echo ':: Warning: tests failed'
}

package() {
	cd "$pkgname-$pkgver"
	install -Dv target/release/evtx_dump -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
