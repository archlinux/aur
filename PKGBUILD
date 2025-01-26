# Maintainer: Bert Peters <bert@bertptrs.nl>
_npmname=node-pre-gyp
pkgname=nodejs-$_npmname
pkgver=2.0.0
pkgrel=1
pkgdesc="Node.js tool for easy binary deployment of C++ addons "
arch=('any')
url="https://github.com/mapbox/node-pre-gyp"
license=('BSD-3-Clause')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@mapbox/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('29c4949a4fa54ac2a4657c8ba22d8099bc794a55fe43c6590269d48b1a97ed09')

package() {
	npm install -g --prefix "$pkgdir/usr" "$_npmname-$pkgver.tgz"

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/@mapbox/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	# Fix a weird permission thing
	chmod 755 "$pkgdir/usr/lib/node_modules"

	# Install LICENSE in a more findable spot.
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
		"$pkgdir/usr/lib/node_modules/@mapbox/$_npmname/LICENSE"
}
