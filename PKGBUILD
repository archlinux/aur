# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=punt
pkgauthor=lance0
pkgver=0.5.1
pkgrel=1

_npmname=${pkgname}
_npmauthor=@${pkgauthor}
_npmver=${pkgver}

pkgdesc="Share terminal output instantly via punt.sh - quick, colorful, ephemeral."
pkgver=${_npmver}
pkgrel=1
arch=("x86_64")
url="https://github.com/lance0/punt"
license=("MIT")

depends=("bun")
makedepends=("npm" "jq")
provides=("${_npmname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmauthor}/${_npmname}/-/${_npmname}-${_npmver}.tgz"
		"LICENSE")
b2sums=('ff3cf7c0fd10a4c0829ed88fd2504b4655542db44b091afbfe8fb935479e8bd317f2840c0df2b8f46e30533e061bd940547a3147715402716bb10fea1ac03086'
        'a6be06b0de44522f0544e243c10d19051af0b3e1922ada7ebe236e00cfed39d9b560065fb229c85b5a59de8a449f3aead290bbd95a9cd204f2a9b9d75a0e0212')

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
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
