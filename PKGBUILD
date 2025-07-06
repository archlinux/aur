# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_npmname=cloudcmd
pkgname=$_npmname
pkgver=18.7.1
pkgrel=1

pkgdesc="Cloud Commander file manager for the web with console and editor."
arch=("x86_64")
url="https://github.com/coderaiser/cloudcmd"
license=("MIT")

depends=("glibc" "nodejs")
makedepends=("npm" "jq")
provides=("$_npmname")
conflicts=("$_npmname")
# options=(strip emptydirs zipman)
changelog="changelog.md"

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
		"https://raw.githubusercontent.com/coderaiser/cloudcmd/v${pkgver}/LICENSE")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('a182083d14d3b7ffd6c76fd33c51f126692c2b54eeb23cb7ab324c53ca7f0b73195d1ec734ed901f8fdb818bb1641cea970d81f4325bde26a30a6aad7f758aa7'
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
