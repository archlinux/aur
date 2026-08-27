# Maintainer: nothing_glows <wppopqpu@outlook.com>
pkgname=tformula
_pkgname=$pkgname
pkgver=0.3.1
pkgrel=1
pkgdesc='Render LaTeX and read Markdown with images directly in the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/mikewang817/TFormula'
license=('MIT')
options=('!debug')
depends=('nodejs>=20')
makedepends=('npm' 'jq' 'node-gyp' 'python')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('d15c8d3cc239438a696a499f31338fc7315bae72edd41fecca0a661d56c0ed0e')

package() {
	npm install -g --prefix "$pkgdir/usr" \
		--cache "$srcdir/npm-cache" \
		--no-audit --no-fund \
		--allow-scripts=node-pty,sharp \
		"$srcdir/$_pkgname-$pkgver.tgz"

	# These are upstream build-time sources and scripts, not needed at runtime.
	rm -rf "$pkgdir/usr/lib/node_modules/$_pkgname/node_modules/katex/src" \
		"$pkgdir/usr/lib/node_modules/$_pkgname/node_modules/node-pty/deps"

	# node-pty only loads build/Release/pty.node at runtime. Remove node-gyp's
	# build intermediates, which retain absolute paths to the build root.
	local nodepty="$pkgdir/usr/lib/node_modules/$_pkgname/node_modules/node-pty"
	find "$nodepty/build" -type f ! -path "$nodepty/build/Release/pty.node" -delete
	find "$nodepty/build" -depth -type d -empty -delete

	find "$pkgdir/usr/lib/node_modules" -name package.json -print0 |
		xargs -r -0 sed -i '/"_where"/d'

	local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
	local tmpjson
	tmpjson=$(mktemp)
	jq '. |= with_entries(select(.key | test("^_.+") | not))' "$pkgjson" > "$tmpjson"
	mv "$tmpjson" "$pkgjson"
	chmod 644 "$pkgjson"

	install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chown -R root:root "$pkgdir"
}
