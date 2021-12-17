# Maintainer: Bert Peters <bert@bertptrs.nl>
_npmname=node-pre-gyp
pkgname=nodejs-node-pre-gyp
pkgver=1.0.8
pkgrel=1
pkgdesc="Node.js tool for easy binary deployment of C++ addons "
arch=('any')
url="https://github.com/mapbox/node-pre-gyp"
license=('BSD')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@mapbox/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha1sums=('32abc8a5c624bc4e46c43d84dfb8b26d33a96f58')

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
