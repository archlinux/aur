# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
_pkgver=2.0.0-pre
pkgver="${_pkgver//-/_}"
pkgrel=2
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
sha256sums=('582248f3db5186ebb7f89eacf0ce927ad00798e0c4cbc381a6aa83238bb0c0c7')
b2sums=('4f862c6fb9d6ec47dc2b6aeed380d75d304b63838f2f3b740f8f5f13b861859810937d5b90cc7b3ae0cd69bb0bc03634642435eeb4c0e1e9155cb4e4b2482cd3')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$_pkgver.tgz"

	cd "$pkgdir/usr/bin"
	# zsh completion is broken
#	SHELL=/bin/zsh readable --completion \
#		| install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_readable"
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

