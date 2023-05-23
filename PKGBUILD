# Author of software: jedisct1
# Maintainer of this package: Jan Ole Zabel <joz@spline.de>
# Package contributors: mys_721tx, dreieck
pkgname=doh-proxy
reponame=doh-server
pkgver=0.9.9
pkgrel=1
pkgdesc="A DNS-over-HTTP server proxy written in Rust by jedisct1"
arch=('x86_64' 'aarch64')
url="https://github.com/jedisct1/$reponame"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('4cd66672e17761076b09034c130a832c74d4129f45961f1661025ba6c3e034454bbb16a4ad951c9ef997a9d79f3a3227a56f0e5a6a0ba4e244db8b3c70802546')

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

