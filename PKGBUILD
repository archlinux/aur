# Maintainer: Cristóbal Tapia <crtapia at gmail dot com>
pkgname=bibtex-tidy
pkgver=1.1.1
pkgrel=1
pkgdesc="BibTeX Tidy - Cleaner and Formatter for BibTeX files "
arch=('any')
url="https://github.com/sheerun/bower-away"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/bibtex-tidy/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('0e443578c31bbb8e3a6fba0a3c999a2f5687c1b8c88ae18896ae84e5bce3e302')

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
	# install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
