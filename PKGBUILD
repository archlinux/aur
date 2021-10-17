# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint
pkgver=0.18.1
pkgrel=1
pkgdesc='Pluggable and configurable code formatting platform'
arch=('x86_64')
url='https://dprint.dev/'
license=('MIT')
depends=('gcc-libs' 'bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dprint/dprint/archive/$pkgver.tar.gz")
sha512sums=('884ccd1783be999845b2c527353b0d734beccbfe051122e594e7b3430c0cc145a20e51c24644b6f3cc1f0ed931013e1c4956082849722ca3fa92b4817be7c156')

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

# check() {
# 	export RUST_TOOLCHAIN=stable
#
# 	cd "$pkgname-$pkgver"
# 	cargo test --frozen --all-features
# }

package() {
	cd "$pkgname-$pkgver"
	install -D target/release/dprint -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find docs -type f -exec install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" '{}' \+
}
