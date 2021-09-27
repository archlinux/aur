# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=zapier-platform-cli
_pkgname="${pkgname%-platform-cli}"
pkgver=11.1.1
pkgrel=1
pkgdesc='Gateway to creating custom applications on the Zapier platform'
arch=('x86_64')
url='https://platform.zapier.com/cli'
license=('UNLICENSED')
depends=('nodejs')
makedepends=(
	'npm'
	'jq'
)
optdepends=('bash-completion: for tab completion')
provides=("$_pkgname")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=(0ced9d6ee1e3e3c6ef2ce9486f63fb4be8069166a0de1c9b11d62b7fd20439b99c0c275f0ac27d6844f57c0863b59a28ebea9c3d20a8e5e0bd31532fa652153e)

package() {
	# https://wiki.archlinux.org/title/Node.js_package_guidelines

	# https://wiki.archlinux.org/title/Node.js_package_guidelines#Setting_temporary_cache
	npm install --cache "$srcdir/npm-cache" -g --prefix "$pkgdir/usr" "$srcdir/$noextract"

	# Shell completions
	# Please file an issue to enable specifying completion path
	"$pkgdir/usr/bin/zapier" autocomplete --refresh-cache

	install -Dm 644 ~/.cache/"$pkgname"/autocomplete/functions/bash/"$_pkgname".bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm 644 ~/.cache/"$pkgname"/autocomplete/functions/zsh/_"$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"

	# https://wiki.archlinux.org/title/Node.js_package_guidelines#Package_contains_reference_to_$srcdir/$pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"
}
