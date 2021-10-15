# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
pkgver=2.3.4
pkgrel=1
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url="https://www.npmjs.com/package/$pkgname"
license=('GPL3')
depends=('nodejs')
makedepends=('npm' 'jq')
optdepends=('bash-completion: Bash completion'
            'zsh: zsh completion')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('3e9c0021518bd1b1cc1b2a6421a07dfc31bedd11691ddbe2ba9df5bbe19d06b3')
b2sums=('f0f60682f99e340b6a75d0d8f310c4b44cdc9f7df0614dde466981f8e0f1a0855934e353a34d84b6dba4a993bf81e5de0a2c332318b5fda5421b2a32179d6c80')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Shell completions
	cd "$pkgdir/usr/bin"
	SHELL=/bin/zsh ./readable --completion \
		| install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_readable"
	SHELL=/bin/bash ./readable --completion \
		| install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/readable"
	cd -

	# Man pages
	cd "$pkgdir/usr/share/man/man1"
	cp --no-dereference 'readability-cli.1' 'readable.1'
	cd -


	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" > "$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done
}

