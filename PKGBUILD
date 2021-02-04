# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
_pkgver=2.2.1-pre
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url="https://www.npmjs.com/package/$pkgname"
license=('GPL3')
depends=('nodejs')
makedepends=('npm' 'jq')
optdepends=('bash-completion: Bash completion'
            'zsh: zsh completion')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz")
noextract=("$pkgname-$_pkgver.tgz")
sha256sums=('3addf9c408b9999fd93d0d9cfa75a7dd5767483a682ff1e9232a466321a402e9')
b2sums=('38113eb227f314fd204bc3ea4bf1de12536df66dec4bf52700539f4f5a3f43a44db55958f026a471207c24a5965ed13c3c5cfcc414c63f3c29420353c89a4bb2')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$_pkgver.tgz"

	# Shell completions
	cd "$pkgdir/usr/bin"
	SHELL=/bin/zsh ./readable --completion \
		| install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_readable"
	SHELL=/bin/bash ./readable --completion \
		| install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/readable"
	cd -


	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

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

