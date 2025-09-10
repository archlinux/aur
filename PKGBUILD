# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgname=nanocoder
pkgauthor=Mote-Software
pkgver=1.9.0
pkgrel=1

_npmname=nanocoder
_npmauthor=@motesoftware

pkgdesc="A beautiful local-first coding agent running in your terminal"
arch=("x86_64")
url="https://github.com/${pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${pkgauthor}/${pkgname}/v${pkgver}"
license=("MIT")
replaces=("nodejs-${pkgname}")
depends=("bash" "nodejs")
makedepends=("npm" "jq")
provides=("${pkgname}")
options=(!strip emptydirs staticlibs zipman)

source=("https://registry.npmjs.org/${_npmauthor}/${_npmname}/-/${_npmname}-${pkgver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
noextract=("${pkgname}-${pkgver}.tgz")

b2sums=('02eb4b8b2797ee76e44a857a977be57c416082aaf737dc89be03765e6c0b5b4e1ee24e14fc4773af7cb708124d6796c8c901156b8cdff54c60e60000098decff'
        '3e8026e7270d3b9d0e99ee8775fdea0fa18e718c0a8f3c8458902ddf5a2bb996e8e5d3dc76726309bc8c77a4816e21ea946cad56df649ff7a7b736c0022baf35'
        '9cde14a5c7909ccaa6db312625e46eb6885097c7e7f70916ed0412037b1418dd8139d5616dcef87fc22ad68fb5632e4b251af562598d076f34c7e46ac7293352')

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
