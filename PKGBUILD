# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=sqlite3
pkgname=nodejs-$_npmname
pkgver=5.1.7
pkgrel=1
pkgdesc='Asynchronous, non-blocking SQLite3 bindings'
arch=(x86_64)
url="https://github.com/mapbox/${pkgname/js-/-}"
license=(GPL3)
depends=(nodejs nodejs-node-pre-gyp)
makedepends=(jq moreutils npm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fbfa89d06de316a51cf7d4734a19c61b876bb685d33593992617c12d0a950732')

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
