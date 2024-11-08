# Maintainer: Johannes Schöpp <darkdiscover at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=evtx
pkgver=0.8.4
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
sha256sums=('4273643dbcc5ec25484e393c14fd03e4749868703fc1d3d966e95016637ebd1c')

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
