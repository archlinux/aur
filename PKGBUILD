# Maintainer: jolupa <jlpavon@me.com>
pkgname=nodejs-afterwriting
_pkgname=afterwriting
pkgver=1.11.0
pkgrel=1
pkgdesc="Afterwriting CLI is a command line tool that lets you generate PDF from your fountain script using node.js."
arch=('any')
url="https://github.com/ifrost/afterwriting-labs/blob/master/docs/clients.md"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/afterwriting/-/$_pkgname-$pkgver.tgz"
        "LICENSE")
sha256sums=("5f4d4d20c5029591a06c5f4636b4c5eb165ca1a852b778596519d2a16d12d5e7"
            "abb42abaef9d2198f1d38b5b40c3c8accec9a8e8bdea7b0994270d75a3beb931")
noextract=("$_pkgname-$pkgver.tgz")

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	# Install license since the package doesn't include it
	install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
