# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=fkill
_npmname=fkill-cli
pkgver=6.1.0
pkgrel=2
pkgdesc="Fabulously kill processes. Cross-platform."
arch=('any')
url="https://github.com/sindresorhus/fkill-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
#noextract=("$_npmname-$pkgver.tgz")
sha256sums=('4df84f692413dfa2720f20d9cb5feecca1cf8bf4ff59b4d5c6e17f3587104ef3')

package() {
	npm install \
		--cache "$srcdir/npm-cache" \
		-g \
		--user root \
		--prefix "$pkgdir"/usr \
		"$srcdir"/$_npmname-$pkgver.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"

	# Remove references to $pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	install -Dm644 "$srcdir/package/license" -t "$pkgdir/usr/share/licenses/$pkgname"

	rm -rf "$pkgdir/usr/lib/node_modules/root"
}
