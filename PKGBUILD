# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint
pkgver=0.42.3
pkgrel=1
pkgdesc='Pluggable and configurable code formatting platform'
arch=('x86_64')
url='https://github.com/dprint/dprint'
license=('MIT')
depends=('bzip2')
provides=('dprint')
conflicts=('dprint-bin')
makedepends=('cargo')
options=('!lto') ## interferes with compiling
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('1ad679659a56b02f334d2a05ccf9f07ca74140357932037c24fd4f64234e2671')

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
	install -Dv target/release/dprint -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
