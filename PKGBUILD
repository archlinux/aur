# Maintainer: bert@bertptrs.nl
pkgname=bower-away
pkgver=1.1.2
pkgrel=3
pkgdesc="Convert your project from Bower to Yarn"
arch=('any')
url="https://github.com/sheerun/bower-away"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/bower-away/-/$pkgname-$pkgver.tgz"
        "LICENSE")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('e9a3d70b39fe388768f4c2efc931a2f199fc68f90e6c310ea51d02f2d58a6db2'
            '6be9328337c8f17e83b24fbebee8c6258eb364044de0dce7238afde57eaf8ae6')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	# Install license since the package doesn't include it
	install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
