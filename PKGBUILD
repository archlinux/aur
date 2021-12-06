# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint
pkgver=0.19.1
pkgrel=1
pkgdesc='Pluggable and configurable code formatting platform'
arch=('x86_64')
url='https://dprint.dev/'
license=('MIT')
depends=('gcc-libs' 'bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dprint/dprint/archive/$pkgver.tar.gz")
sha256sums=('c4019e8d0fd5301bc2752ebc7dfea10de7410f77ce8c74e2ac5a7a0eafcd3772')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUST_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd "$pkgname-$pkgver"
	cargo build --release --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -D target/release/dprint -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find docs \
		-type f \
		-exec install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" '{}' \+
}
