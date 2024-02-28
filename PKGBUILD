# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_npmname=autocannon
pkgname=nodejs-$_npmname
pkgver=7.15.0
pkgrel=1

pkgdesc="fast HTTP/1.1 benchmarking tool written in Node.js"
arch=(any)
url="https://github.com/mcollina/autocannon"
license=("MIT")

depends=("nodejs")
makedepends=("npm" "jq")
provides=("$_npmname")
conflicts=("$_npmname")
changelog="changelog.md"

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
	"https://raw.githubusercontent.com/mcollina/autocannon/master/LICENSE")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('6ce197e98ebdbf5bad1ec82dafbc71bafa9a9b1607bfc6d2c59dd8387200efccc7fd3814cec69de2125de7a2ba5a5a15ba383e52765d90cdc14d0b51db04a7c5'
	'ac1f56051dfc2f729db4d635ff40ab143314a29b3a3259967e1d83ab1b26cb53059a29d3ec52f1358e588b90cadbcc4a63cf3feb485770b085b7cbfd8313e43a')

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
