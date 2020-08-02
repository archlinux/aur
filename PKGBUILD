# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
pkgver=1.1.2
pkgrel=2
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url="https://www.npmjs.com/package/@gardenapple/readability-cli"
license=('GPL3')
depends=('nodejs')
makedepends=('npm' 'jq')
source=()
noextract=()

package() {
	npm install -g --user root --prefix "$pkgdir/usr" @gardenapple/readability-cli@${pkgver}


	#Things that should be done according to Arch Wiki's package guidelines for Node.js:

	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/@gardenapple/readability-cli/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"
}

