# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint
pkgver=0.18.0
pkgrel=1
pkgdesc='Pluggable and configurable code formatting platform'
arch=('x86_64')
url='https://dprint.dev/'
license=('MIT')
depends=('gcc-libs' 'bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dprint/dprint/archive/$pkgver.tar.gz")
sha512sums=('408287c6e4dd58648108d6a694a4a1c661024b379431348c641ac690f77d2053ca5bbb6e4ecd80062bb2f7143af6c96d3c95bb2e47b46da06c1af2830b41e6fe')

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
	install -Dm 755 target/release/dprint -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find docs -type f -exec install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" '{}' \+
}
