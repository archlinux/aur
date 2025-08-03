# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_npmname=periodic-table-cli
pkgname="$_npmname-js"
pkgver=2.1.2
pkgrel=1

pkgdesc="An interactive Periodic Table of Elements app for the console (NodeJS)"
arch=("x86_64")
url="https://github.com/spirometaxas/periodic-table-cli"
license=("MIT")

depends=("nodejs")
optdepends=()
makedepends=("npm")
conflicts=("${_npmname}-py")
provides=("${_npmname}")

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
		"https://raw.githubusercontent.com/spirometaxas/periodic-table-cli/v${pkgver}/LICENSE"
		"https://raw.githubusercontent.com/spirometaxas/periodic-table-cli/v${pkgver}/README.md")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('da18a71d1c8274474b965d409675e728e7af6c242e056722613e688fb88706345c0586e47d978ab8a4d281a6d9363786bbd7b7524c09944bf6ff6c1505c33bfd'
        'f28d55b22b73e7eb788e355f847d63e9a74b323a254c4854664d3e6f1344dc7020073be511f4a80582d806af640c50330550f13f788e42fb71e4c97b04164d58'
        '966d27b4372222f97bff666804659a71bb990fb8fc67943364a84224115f3e940d4311fab0408b26edc4258932ea4f10759db9b2b1db36af25d2673f706d79ab')

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
	# Install README.md file
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
