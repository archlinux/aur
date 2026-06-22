# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=d7omdev
pkgname=tupass
pkgver=0.2.0
pkgrel=1
pkgdesc="A fast, keyboard-driven terminal UI for GNU pass, built with OpenTUI"

_npmname=${pkgname}
_npmver=${pkgver}

arch=("x86_64")
license=("MIT")
url="https://github.com/${pkgauthor}/${pkgname}"

depends=("nodejs" "bun")
makedepends=("npm" "jq")
provides=("${_npmname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz" "LICENSE")
b2sums=('b23dbb753e7803cf9fdc67e8c297a35258eeafc2c9fe313524d97f470142b8129d936cd0336d45f2295e6a6ba124a4a056a98a689c30fa625134258c0e0e506d'
        '04ab96465ce4c2469766658172723846b57e3d6ef0a782053cee5bfee947b5b7681370124b35d2e300812070af4f38c76c2289f32a6ac53dfe4fd92ab00fb4c7')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	msg2 "Install using Using npm"
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
	local pkgjson="${pkgdir}/usr/lib/node_modules/${_npmname}/package.json"
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
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
