# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kmdr-cli
pkgver=0.4.2
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
sha256sums=('5b764675321eac2f8e8c25a686b5201a49a05cd3196bc7f30757e67a52bbbc0b')

package() {
	cd "$pkgname-$pkgver"
	npm install kmdr@latest \
		--cache "$srcdir/npm-cache" \
		-g \
		--user root \
		--prefix "$pkgdir"/usr

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

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
