# Maintainer: Cristóbal Tapia <crtapia at gmail dot com>
pkgname=bibtex-tidy
pkgver=1.2.2
pkgrel=2
pkgdesc="BibTeX Tidy - Cleaner and Formatter for BibTeX files "
arch=('any')
url="https://github.com/FlamingTempura/bibtex-tidy"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/bibtex-tidy/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('816c24713c3baff23ee9a6fa10f73754f50475400bba8dcf583c6e894b52c34f')

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
