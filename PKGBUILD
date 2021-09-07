# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gradient
pkgver=0.2.1
pkgrel=1
pkgdesc="CLI tool for playing with color gradients"
arch=('x86_64')
url="https://github.com/mazznoer/gradient-rs"
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1e1272d53838d021387e04a171c514b51239afb4c4601fc1fabda0d38614d682')

prepare() {
	cd "$pkgname-rs-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-rs-$pkgver"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-rs-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-rs-$pkgver"
	install -Dm 755 target/release/gradient -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
