# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_npmname=clinic
pkgname=nodejs-$_npmname
pkgver=10.0.0
pkgrel=1

pkgdesc="diagnoses your Node.js performance issues"
arch=(any)
# url="https://clinicjs.org/"
url="https://github.com/clinicjs/node-clinic"
license=("MIT")

depends=("nodejs")
makedepends=("npm" "jq")
provides=("$_npmname")
conflicts=("$_npmname")
options=(!strip emptydirs zipman)

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
	"https://raw.githubusercontent.com/clinicjs/node-clinic/main/LICENSE")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('d30855c4e430f15985749e1bfcd1252d531e885d65e26aca8a95a4771b2ccba6f3c589dde1e0289ad3eac9b8d4fb817d350ebd478a71bc1930f380540ac7ecd4'
	'1f41dbdf32988d8c90a6762c97ff7292bdad10bbd7e900817d50862bf43e4c0c750189da6a4a990beea158b499526d54f208272e41fd18fd39a7d428231dfbb5')

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

	# Remove broken files
	rm -rf $pkgdir/usr/lib/node_modules/clinic/node_modules/module-deps/test/invalid_pkg/

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
