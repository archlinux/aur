# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=nanocoder
pkgauthor=Mote-Software
pkgver=1.20.1
pkgrel=1

_npmname=nanocoder
_npmauthor=@nanocollective

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
changelog="changelog.md"

source=("https://registry.npmjs.org/${_npmauthor}/${_npmname}/-/${pkgname}-${pkgver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
noextract=("${pkgname}-${pkgver}.tgz")

b2sums=('edd9465aa398535e4e067faf94c858bdc0c9e7bebb23c7e7253de8112f2fadf53b76aeb01f0a8ab07703a581ef6d5b80c855c8b79389d694123aedddeaca9372'
        'dee23d534ff3ba8dbda2aacfa0002e6d68f6b0cd42799a52227e46147102742a4e45704e0f2e0d46b7bed8a8b031a9ae5eb6dd30108d2e34138b331801219d37'
        'bfbf59c36e5927ef63ec74b97f815e2730acb4072807f043c78fab72dba54d1a7a9dc05e42132ced5544016d765ea0f8fd12d33f038ffe3b8d037f0d4c85df90')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	msg2 "Install using NPM"
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${pkgname}-${pkgver}.tgz"

	msg2 "Fix ownership of ALL FILES"
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	msg2 "Remove references to ${pkgdir}"
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

	msg2 "Install README file"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -Dm 644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
