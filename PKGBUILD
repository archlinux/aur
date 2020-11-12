# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
pkgver=1.2.1
pkgrel=1
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url="https://www.npmjs.com/package/$pkgname"
license=('GPL3')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('710609a2a171a9723531dfbe79d6faa6188760e0783cddab75abfa0baf7c6516')
b2sums=('7660431cd529324bcacd43dfb20d04329ccd33b8c4b199d4e60573a312428f1dcb59bb1ddb875f6ee63e909dec9ab9df11f49e638d5c1faecfcd5c18f1b784ab')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"


	#Things that should be done according to Arch Wiki's package guidelines for Node.js:

	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"
}

