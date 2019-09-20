# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=kmdr-cli
pkgver=0.1.35
pkgrel=1
pkgdesc="The CLI tool for explaining commands from your terminal"
arch=('any')
url="https://kmdr.sh"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
provides=("${pkgname%-cli}")
conflicts=("${pkgname%-cli}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ediardo/kmdr-cli/archive/v$pkgver.tar.gz")
sha256sums=('1b1570fe374289a276e4cea55df2ed69e5cf790cbd5dc7b3a42e6eb4b8e94030')

package() {
	npm install --cache "$srcdir/npm-cache" -g --user root --prefix "$pkgdir"/usr \
		"$srcdir"/$pkgname-$pkgver.tar.gz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "$pkgdir"/usr -type d -exec chmod 755 {} +
	
	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/${pkgname%-cli}/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
