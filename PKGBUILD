# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
_pkgauthor=gardenapple
pkgver=1.1.4
pkgrel=1
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url="https://www.npmjs.com/package/@$_pkgauthor/$pkgname"
license=('GPL3')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@$_pkgauthor/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('4b413d6d6a1211fe16b887aea54791a4b32bf1701767fa6c445108f7b165c15e')
b2sums=('9166cc327c1b793fcc9bf3ca646b683ea14c39311ec8b32f6ee489170f8f0e3c74c7ac733ad0fd42f8eabc3cdf7d225e646c087da588fc5013cf7b04b737eaa8')

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

