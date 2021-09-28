# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=todo
pkgver=2.1
pkgrel=1
pkgdesc='Todo CLI program'
arch=('x86_64')
url='https://github.com/sioodmy/todo'
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5ce4c6f07b22bbf6de4facab1eaaf3fe1d86d604b542d83e0d6c26b8a8ff6838')

prepare() {
	cd "$pkgname-$pkgver"
	cargo update
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
	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
