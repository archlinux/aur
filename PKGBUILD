# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Ben Silverman <bensilverman10 at gmail dot com>

pkgname=alacritty-themes
pkgver=4.1.6
pkgrel=2

pkgdesc="A utility for choosing and applying Alacritty terminal themes."
arch=(any)
url="https://github.com/rajasegar/alacritty-themes"
license=("MIT")

depends=("nodejs")
makedepends=("npm" "jq")
conflicts=("$pkgname")
# install="$pkgname.install"

source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
	"https://raw.githubusercontent.com/rajasegar/alacritty-themes/master/LICENSE")
noextract=("${pkgname}-${pkgver}.tgz")
b2sums=('1b662634f0f4d43912568c36927a34548cce77709674dcd3102e4c3bd082ad435cdd5fe65eaf6857755a3fc050bb6747f30f7dd6f86117efc53f3e3895a812f8'
	'7a11e2eeed89bc67e6cef84badf8cccd1bf2de44423c22bd023fe579795b45bc8906c7a2dc3df4c005d0524b99994d2f534410df8e9a52e2d95f97591dd8949c')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	npm install --verbose -g --cache "${srcdir}/npm-cache" --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
	find "${pkgdir}/usr" -type d -exec chmod -v 755 {} +
	chown -vR root:root "${pkgdir}"
	find "$pkgdir" -name package.json -print0 | xargs -t -n1 -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
	mv -v "$tmppackage" "$pkgjson"
	chmod -v 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" >"$tmppackage"
		mv -v "$tmppackage" "$pkgjson"
		chmod -v 644 "$pkgjson"
	done
}
