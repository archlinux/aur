# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_npmname=autocannon
pkgname=nodejs-$_npmname
pkgver=7.12.0
pkgrel=1

pkgdesc="fast HTTP/1.1 benchmarking tool written in Node.js"
arch=(any)
url="https://github.com/mcollina/autocannon"
license=("MIT")

depends=("nodejs")
makedepends=("npm" "jq")
provides=("$_npmname")
conflicts=("$_npmname")
options=(strip emptydirs zipman)

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
	"https://raw.githubusercontent.com/mcollina/autocannon/master/LICENSE")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('5bde160ec33100a3e2d20514c111e2d8617c8b763076eb06dd5447eb20cdf5ad217cb2bb0d0e084ae65459e3cf7d2d0dccc52c4b794f01d9d73d52825f85355a'
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
