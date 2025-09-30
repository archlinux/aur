# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=bifrost
pkgauthor=maximhq
pkgver=1.5.0
pkgrel=1

_npmname=bifrost
_npmauthor=@maximhq
_npmver=1.5.0

pkgdesc="The Fastest LLM Gateway with built in OTel observability and MCP gateway"
arch=("x86_64")
url="https://github.com/${pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${pkgauthor}/${pkgname}/npx/v${pkgver}"
license=("Apache-2.0")
replaces=("nodejs-${pkgname}")
depends=("bash" "nodejs")
makedepends=("npm" "jq")
provides=("${pkgname}")
options=(!strip emptydirs staticlibs zipman)

source=("https://registry.npmjs.org/${_npmauthor}/${_npmname}/-/${_npmname}-${_npmver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
noextract=("${_npmname}-${_npmver}.tgz")

b2sums=('09e438dbb6018aef232bbb8e634e876eef99e88dee00c9a3c65568af33b7b408aec2365e2e770ecebe36e8e123c7d6d1d763ce5da9e56d34d7d04e0d217ebb98'
        '1e240b2356ec1c876036e3fcf3bd2fc594683cb30e1ab3495d3623c78d224ac461ac20a45291065f9bc1da78251b244f87f55667425fad0a64ff0f38dbb9f70a'
        'fa356314d0a2e4fa028b5980c1b64295a17524ee8fea5b8f4dfa40eedeb59637b3ad99d5a647c9d7a8e284ff9344b29a0a45764156381c0b68d9cb9bc6556068')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	# Install using Using npm
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${_npmname}-${_npmver}.tgz"

	# Fix ownership of ALL FILES
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="${pkgdir}/usr/lib/node_modules/${_npmauthor}/${_npmname}/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
	mv "${tmppackage}" "${pkgjson}"
	chmod 644 "${pkgjson}"

	find "${pkgdir}" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "${pkgjson}" > "${tmppackage}"
		mv "${tmppackage}" "${pkgjson}"
		chmod 644 "${pkgjson}"
	done

	# Install README file
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Install LICENSE file
	install -Dm 644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
