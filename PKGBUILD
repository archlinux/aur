# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Lemieux <eric at lemieuxdev dot com>

pkgname=dank
pkgver=2.2.1
pkgrel=1
pkgdesc='Reddit meme downloader'
url='https://github.com/EricLemieux/dank'
license=('Apache')
arch=('x86_64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1da5783ab7839ed1a307adadbfb569c28e3ed52e4238d8b5394fcb308f05899b')

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
	install -D target/release/dank -t "$pkgdir/usr/bin/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
