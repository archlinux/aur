# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=svg-hush
pkgver=0.9.0
pkgrel=1
pkgdesc='Sanitizes SVGs of arbitrary code'
arch=('x86_64')
url='https://github.com/cloudflare/svg-hush'
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('14899e4e77e67d6ecf8208b20f55cbcbda4bd60ee8cd5e323b4ff4d90a6f95f7')

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
	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	# install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
