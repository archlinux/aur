# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
_pkgauthor=gardenapple
pkgver=1.1.3
pkgrel=1
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url="https://www.npmjs.com/package/@$_pkgauthor/$pkgname"
license=('GPL3')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@$_pkgauthor/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('8f2dec1d1d216c0837e30fc624fb7e43120890829efd189f9d8c70f241dd9e80')
b2sums=('db2554c7ada086cd515fb2c7818c1cac7797cfcd91ccdea0f78832b25cbb7a307e6696b4cdc2970d38f66a9d05c51c1cc7b97641002b7109b4dff408f7fd95e2')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"


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

