# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=nanocoder
pkgauthor=Mote-Software
pkgver=1.11.2
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

b2sums=('47640f96924cef62655a18a9920409ce9956d6332743df316ca7519c2f3879108046e2be7ee2f446d187c4436a0529617f148a9229deab60585eb0d69b9b23f1'
        'dab638b809530f25133419a8880f388b363ac0a11ed33ad263c1a1ea64aa455db0dbfcdce21f117eda38e823c94b5ec382e22fe2d94f4ffff125ef46c7613f8b'
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
