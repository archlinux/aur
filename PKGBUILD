# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=bifrost
pkgauthor=maximhq
pkgver=1.6.3
pkgrel=1

_npmname=${pkgname}
_npmauthor=@${pkgauthor}
_npmver=${pkgver}

pkgdesc="The Fastest LLM Gateway with built in OTel observability and MCP gateway"
arch=("x86_64")
url="https://github.com/${pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${pkgauthor}/${pkgname}/main"
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

b2sums=('acb12136b36e79fa1b75f22eff2c6104a4e661d46e21b8883bdf65a5d78510ae8fa9fe4752feff88ffb91517842eea15d8098ffc6f96f99866ea5ca65c0fe13f'
        'aa492b35e945b7792a3e3837a74e4a13b8ec0c1d26c08747d060f89d4861e23195638cf60abffab018b71558e3dc6e5aee3715e1dc93a307b696b1620459a98e'
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
