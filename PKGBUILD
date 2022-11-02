# Maintainer: Evan Chen <evan at evanchen dot cc>

pkgname=prettier-plugin-latex
pkgver=1.2.4
pkgrel=1
pkgdesc="Plugin to format LaTeX with prettier.js"
arch=(any)
url=https://github.com/siefkenj/prettier-plugin-latex
license=(MIT)
depends=(nodejs prettier)
makedepends=(jq npm)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-$pkgver.tgz")
sha256sums=('746a653e8b00c82e3ad3280e90b6112e44d8c612cbc3d6fe33c0c53cb735a57c')

package() {
	npm install -g --prefix "$pkgdir/usr" --no-bin-links "$srcdir/$pkgname-$pkgver.tgz"

	# `local json tempjson` is unnecessary because commands in pipelines are
	# executed in their own subshells
	local mainjson=$pkgdir/usr/lib/node_modules/@${pkgname%%-*}/${pkgname#*-}/package.json
	find "$pkgdir/usr" -type f -name package.json -print0 |
		while read -rd '' json; do
			tempjson=$(mktemp)
			if [ "$json" = "$mainjson" ]; then
				jq 'with_entries(select(.key | test("^_.+") | not))' \
					"$json" >"$tempjson"
			else
				jq 'del(._where,.man)' \
					"$json" >"$tempjson"
			fi
			cp "$tempjson" "$json"
		done

	# See https://github.com/npm/npm/issues/9359
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	# See https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}

# vim: set ts=2 sw=2 et:
