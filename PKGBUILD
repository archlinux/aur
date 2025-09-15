# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_npmname=cloudcmd
pkgname=$_npmname
pkgver=19.0.3
pkgrel=1

pkgdesc="Cloud Commander file manager for the web with console and editor."
arch=("x86_64")
url="https://github.com/coderaiser/cloudcmd"
_urlraw="https://raw.githubusercontent.com/coderaiser/cloudcmd/v${pkgver}"
license=("MIT")
replaces=("nodejs-${_npmname}")
depends=("glibc" "nodejs" "python")
makedepends=("npm" "jq")
provides=("$_npmname")

options=(!strip emptydirs staticlibs zipman)
noextract=("${_npmname}-${pkgver}.tgz")
changelog="changelog.md"

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
b2sums=('a3ab97bf7a52d2e4dff05871f5cc44daf9c143bfa9f330d5e2e1ae2f14c7ca73d494a082e1b389734be4ac011ff8b629806b1f281c6dfb603d8565d6e441d767'
        'b6f4982d97f12cdce858f2c41fcaf5f60e6fe9078ce3d2d264cb0b7be6761223d7efcfa9aa7c71de7b534e5e7ddfe6b3b783dfd063194f4e4083f9be5111a4ee'
        'f925bfc0d0ce5b6542af8c5ba101117da11d4b760c65e8907cc6bf8d5ab443c996090f3ffe207d79e97f6f762e657f49522d5a83e81ad5f41cbcae063e27fe04')

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
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" >"$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done

	# Install README file
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Install LICENSE file
	install -Dm 644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
