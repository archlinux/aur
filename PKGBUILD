# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_npmname=parse-torrent
pkgname=$_npmname
pkgver=11.0.16
pkgrel=1

pkgdesc="Parse a torrent identifier (magnet uri, .torrent file, info hash)"
arch=(any)
url="https://github.com/webtorrent/parse-torrent"
license=("MIT")

depends=("nodejs")
makedepends=("npm" "jq")
# provides=("$_npmname")
# conflicts=("$_npmname")

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
	"https://raw.githubusercontent.com/webtorrent/parse-torrent/master/LICENSE")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('c751ab740885e652eeb1f9b5ebab403a121f5afb69be902ed580409e488148db29856725e342878e04f230426f3ff5773cfa934d83aa81301586107356e2caa2'
	'3890a8cd095787f6ab383fe3ca0a0bf0999d80a7ea65627bb1a50f1c2690987f53e0619df5745ba47d6ef46d32e03573b5a52330a7c857220e4db96a33203019')

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
