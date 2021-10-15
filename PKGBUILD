# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
pkgver=2.3.3
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
sha256sums=('a0cc0490e07cb4c2c63aa10edd2e29fcca9f8870556346845452fd1eb2174b58')
b2sums=('c224238f28a341987274660977f599beaa8c7d1a837f7cade50edadce57af8a338eacdbf954100360d9bc8c3aaed281d313a6232a17c8707958157a5bf38d43e')

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

