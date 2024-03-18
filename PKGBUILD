# Maintainer: Drew Noel <drewmnoel@gmail.com>
_pkgname=xml2json
pkgname="nodejs-$_pkgname"
pkgver=0.12.0
pkgrel=1
pkgdesc="Converts XML to JSON using node-expat"
arch=(any)
url="https://www.npmjs.com/package/$_pkgname"
license=()
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('f5894a8ddffaf9fb5d47b1155d66034c68b6f112e93daad9f0b8add071537d83')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

	# Remove references to pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" > "$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done
}

# vim:set ts=2 sw=2 et:
