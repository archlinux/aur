# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
_pkgauthor=gardenapple
pkgver=1.1.2
pkgrel=3
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url="https://www.npmjs.com/package/@$_pkgauthor/$pkgname"
license=('GPL3')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@$_pkgauthor/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('496567918e11705509f468a0eba6102f57ec3528af7f357d73c5e9a736b6dbf8')
b2sums=('02d0e6686120f2f3e2f631d761e2483dc7e9b1b499876baf03019ad5d461acc394588e0f6e40d2dfb0d881764b1defdccdc739f5af89dded36d788cdf7ea9c90')

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

