# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: donbex <ap dot m at runbox dot com>

pkgname=as-tree
pkgver=0.12.0
pkgrel=2
pkgdesc="Print a list of paths as a tree of paths"
arch=('x86_64')
url="https://github.com/jez/as-tree"
license=('custom:BOML')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2af03a2b200041ac5c7a20aa1cea0dcc21fb83ac9fe9a1cd63cb02adab299456')

prepare() {
	cd "$pkgname-$pkgver"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target/

	cd "$pkgname-$pkgver"
	cargo build --release --frozen --all-features
}

## tests require bazel

package() {
	cd "$pkgname-$pkgver"
	install -D target/release/as-tree -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
