# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="nodejs-ollama"
pkgdesc="Ollama JavaScript library"
pkgver=0.6.4
pkgrel=1

arch=("any")
license=("MIT")
url="https://github.com/ollama/ollama-js"
_urlraw="https://raw.githubusercontent.com/ollama/ollama-js/v${pkgver}"

_npmname=${pkgname#nodejs-}
_npmver=${pkgver}

depends=("ollama" "nodejs")
makedepends=("npm" "jq")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
b2sums=('ee31aee53f98edb12e1f6df435787224c8c778e0ad340eaa51b301b0d5a8817049dbdb3fcd34e90a7ad9506e5624e21e3b0fe880773cc2fb71802e1c11a918dd'
        '8449364779bf79c6b190a4988a94eb38f9ec86966d0f24ccdba81f6942f20988991e6b1cfdf3cba5608072e38032c14f19584b6c3c2b1d62c75a578b7391050c'
        'd60b5c51af9edaf460e87a369bde53d7e4bde120eee26da7c789f7bc25d5c167b1788985309611d58e5fa8d2dbdd85515314e23b77a2f1cbd411d83eecc4d495')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	# Install using Using npm
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${pkgname}-${pkgver}.tgz"

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
	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
