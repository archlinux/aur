# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
_pkgver=2.0.0-pre.3
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url="https://www.npmjs.com/package/$pkgname"
license=('GPL3')
depends=('nodejs')
# Todo: remove git after PR is merged
makedepends=('npm' 'jq' 'git')
optdepends=('bash-completion: Bash completion')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz")
noextract=("$pkgname-$_pkgver.tgz")
sha256sums=('ee6617a580a277071a7bfb9d9f0931a5a4f6ab9fb7618991accf3419b4c97f45')
b2sums=('62cc0f8af487109928537326fe4a8906b754d9aa6c7555e43e4b89fa95c9d63165994047101293428ff96110fd1bfd85f9310ce25ebbdf62bb19369d6d5252e3')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$_pkgver.tgz"

	cd "$pkgdir/usr/bin"
	SHELL=/bin/zsh readable --completion \
		| install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_readable"
	SHELL=/bin/bash readable --completion \
		| install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/readable"
	cd -

	#
	# Things that should be done according to Arch Wiki's package guidelines for Node.js:
	#

	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"
}

