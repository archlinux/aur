# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=evtx
pkgver=0.7.2
pkgrel=1
pkgdesc="Cross-platform parser for Windows XML EventLog Format"
arch=('x86_64')
url="https://github.com/omerbenamram/evtx"
license=('MIT' 'Apache')
depends=('glibc')
makedepends=('cargo')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('31967e3b175a7e0ad4a5d786418066bde66d5ddd4d48626312f59f5081c61ca6')

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
	install -Dm 644 target/release/evtx_dump -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
