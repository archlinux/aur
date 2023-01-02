# Author of software: jedisct1
# Maintainer of this package: Jan Ole Zabel <joz@spline.de>
# Package contributors: mys_721tx, dreieck
pkgname=doh-proxy
reponame=doh-server
pkgver=0.9.6
pkgrel=1
pkgdesc="A DNS-over-HTTP server proxy written in Rust by jedisct1"
arch=('x86_64' 'aarch64')
url="https://github.com/jedisct1/$reponame"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('92621e1d75e8a7cbad9bab0159e85a92e008f8fc252284a56c066c4652f05181c82af7ac0175bf3d7ebd891e07ef32c99fd4a43240cc3b7104d7bccd887854e1')

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

