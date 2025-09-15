# Author of software: jedisct1
# Maintainer of this package: Jan Ole Zabel <joz@spline.de>
# Package contributors: mys_721tx, dreieck
pkgname=doh-proxy
reponame=doh-server
pkgver=0.9.14
pkgrel=3
pkgdesc="A DNS-over-HTTP server proxy written in Rust by jedisct1"
arch=('x86_64' 'aarch64')
url="https://github.com/jedisct1/$reponame"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('775ee4d0446e98674ef6523cfcd1226c346bd90e73ccb8bfae3c1250081a4173d671ca2f22ad8d3944e57d6cab64c896fd6feecec3cc0d3cd02fcf6e54952b9f')
options=('!lto')

prepare() {
	cd "$reponame-$pkgver"
	cargo fetch
}

build() {
	# Handle manually enabled LTO
	RUSTFLAGS="${RUSTFLAGS/-C lto/}"
	export RUSTFLAGS

	cd "$reponame-$pkgver"
	cargo build --frozen --release
}

package() {
	cd "$reponame-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

