# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
pkgname=fkill
_npmname=fkill-cli
pkgver=6.2.0
pkgrel=1
pkgdesc="Fabulously kill processes. Cross-platform."
arch=('any')
url="https://github.com/sindresorhus/fkill-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
#noextract=("$_npmname-$pkgver.tgz")
sha256sums=('0ae9bc4335e68fd9d7c0bc74814f64adad5a00b2ac1d776c659fd62718827880')

package() {
	npm install \
		--cache "$srcdir/npm-cache" \
		-g \
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
}
