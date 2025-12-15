# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=nanocoder
pkgauthor=Mote-Software
pkgver=1.19.1
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

b2sums=('9e765d1ca32ed6f09604d3a0a2b7f2b112169f9f8ec2d1d202ff77f640efcba87bbbca5bae19c3b4248fbb7c235a59dfc37086fd29cc177ef08a87f1db81364d'
        '8c028c7a68b240454ab19ceca38ce7377a538b3366c452bf131fbb956a6a27a0c750a5214908f699c5590b98512ff3d094867471b558cc78b09406c9691648b4'
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
