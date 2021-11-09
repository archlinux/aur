# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=octofetch
pkgver=0.3.3
pkgrel=1
pkgdesc="GitHub stats fetch tool"
arch=('x86_64')
url="https://github.com/azur1s/octofetch"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b6c972b21fdd7ce9588c0eca61b078f031c4e6c7762a455ab15042b26a46522a')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
