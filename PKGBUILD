# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_npmname=cloudcmd
pkgname=$_npmname
pkgver=18.4.0
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
b2sums=('e377ec046e2ad9d389d014e67b6557d7bef6a86dded0c0070fe0c3ecae286cf82c31a0e7432bdd17afae8494909c7ec27fc68fb0419b74efb2266516da6b8473'
        '12e52ded462956c08546683fafcdb19741f1a306e2f3d1e321c1c35867e02b8fad8456226c179d1d408010b6142fffb8da83138a43ee8c21d821877a1c152900')

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
