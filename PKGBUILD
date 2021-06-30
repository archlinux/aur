# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=sqlite3
pkgname=nodejs-$_npmname
pkgver=5.0.2
pkgrel=2
pkgdesc='Asynchronous, non-blocking SQLite3 bindings'
arch=(x86_64)
url="https://github.com/mapbox/${pkgname/js-/-}"
license=(GPL3)
depends=(nodejs nodejs-node-pre-gyp)
makedepends=(jq moreutils npm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('39ce61088a0c51e41e9d8dee59db98f1cf043104a0d78650e67253ef161cfe81')

prepare() {
	cd "${pkgname/js}-$pkgver"
	jq 'del(.dependencies["node-pre-gyp"])' package.json |
		sponge package.json
}

build() {
	cd "${pkgname/js}-$pkgver"
	npm pack
}

package() {
	cd "${pkgname/js}-$pkgver"
	npm install \
		--production \
		--build-from-source \
		-g \
		--cache "$srcdir/npm-cache" \
		--prefix "$pkgdir/usr" \
		$_npmname-$pkgver.tgz
	find "$pkgdir"/usr -type d -exec chmod 755 {} +
	find "$pkgdir" -type f -name package.json \
		-execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
	chown -R root:root "$pkgdir"
}
