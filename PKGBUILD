# Maintainer: gardenapple@posteo.net
pkgname=readability-cli
_pkgver=2.0.0-pre.2
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
sha256sums=('8cab9d799b0df8bd7cc3a3dcbf8fd5ea0ae9d6f7797ec5cda49b5f35b910a2c6')
b2sums=('1089f5aa0080d0d6143912ece55125fdc07a491e34f39df3568f8311a914ff9fc7e3c05bd15596a4233b4ccefd09b7deedb551d0461424b972a34bc0225e0391')

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

