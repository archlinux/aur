# Author of software: jedisct1
# Maintainer of this package: Jan Ole Zabel <joz@spline.de>
# Package contributors: mys_721tx, dreieck
pkgname=doh-proxy
reponame=doh-server
pkgver=0.9.7
pkgrel=1
pkgdesc="A DNS-over-HTTP server proxy written in Rust by jedisct1"
arch=('x86_64' 'aarch64')
url="https://github.com/jedisct1/$reponame"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('3411618b8f1242eb3eca5cd5a4f79fbdfb81946499ae475c6d376114c854bb731ab8ff4346f0f19234bb81cdff11be93d9bcf40a75e561821889e11ca75a971c')

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

