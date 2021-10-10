# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=crabz
pkgver=0.7.2
pkgrel=1
pkgdesc="Cross-platform compression and decompression tool"
arch=('x86_64')
url="https://github.com/sstadick/crabz"
license=('Unlicense' 'MIT')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c4c5a0ec5f8164774f7d83347c321dd9b37f3b3ed40d30e08b6ffed62bffd8ee')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -D target/release/crabz -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE-MIT UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
