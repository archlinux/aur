# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=ollama
_npmver=0.6.3

pkgname=nodejs-$_npmname
pkgdesc="Ollama JavaScript library"
pkgver=$_npmver
pkgrel=1
arch=("x86_64")
url="https://github.com/ollama/ollama-js"
_urlraw="https://raw.githubusercontent.com/ollama/ollama-js/v${pkgver}"
license=("MIT")

depends=("ollama" "nodejs")
makedepends=("npm" "jq")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
b2sums=('51511ceb9905510a5709a31c9aa03e50da16e1858e7daf4aef7e48203dbb9e9253a7278573753174f710d38ca8a62aa7de0f6bcd43bde8d5202ca6a33369fccc'
        '20fe58acfcfd1b1092a29f08370b6b33274936ee5db7c7c57075c9480b0344ab9337b92e5a12fcbaf480eb31907951a63f9ee3eb20a7e96245bed7658c1fe221'
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
