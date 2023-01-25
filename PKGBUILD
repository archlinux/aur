# Maintainer: gardenapple <mailbox@appl.garden>
_pkgname=readability-cli
pkgname="nodejs-$_pkgname"
pkgver=2.4.4
pkgrel=1
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url="https://www.npmjs.com/package/$_pkgname"
license=('GPL3')
provides=('readability-cli' 'readable')
conflicts=('readability-cli')
depends=('nodejs')
makedepends=('npm' 'jq')
optdepends=('bash-completion: Bash completion'
            'zsh: zsh completion')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('4f072dcec2c733ff6e3ab635b91c61c45e20f034ffdbd40949c96843532b84f0')
b2sums=('0a4b2f66a9873199408f945fc94192f40912f11600b2eff75a6d223197d2c01f972edf5c95a1fd7f681aad8aa508ca00ff1e90485f58959a771011ebfe42901d')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

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
	local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
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

