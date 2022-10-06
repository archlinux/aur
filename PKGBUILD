# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Ben Silverman <bensilverman10 at gmail dot com>
# Contributor: Kevin Morris <kevr [at] 0cost [dot] org>

_npmname=alacritty-themes
pkgname=$_npmname
pkgver=5.2.0
pkgrel=1

pkgdesc="A utility for choosing and applying Alacritty terminal themes."
arch=(any)
url="https://github.com/rajasegar/alacritty-themes"
license=("MIT")

depends=("nodejs")
makedepends=("npm" "jq")
# provides=("$_npmname")
# conflicts=("$_npmname")
options=(strip emptydirs zipman)

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
	"https://raw.githubusercontent.com/rajasegar/alacritty-themes/master/LICENSE")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('846bb932faa890cbea80ce19055cc6a0f6237e6d8b869aa5a59bc01c6665be4b0dee57e6e6869b1b1dab5e610c50149938a102417927c35fab46cc866b6b3ec8'
	'7a11e2eeed89bc67e6cef84badf8cccd1bf2de44423c22bd023fe579795b45bc8906c7a2dc3df4c005d0524b99994d2f534410df8e9a52e2d95f97591dd8949c')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	# Install using Using npm
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${_npmname}-${pkgver}.tgz"

	# Fix ownership of ALL FILES
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" >"$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done

	# Install LICENSE file
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
