# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=ingit
pkgauthor=capaj
pkgver=0.6.3
pkgrel=1

_npmname=cli
_npmauthor=@${pkgname}
_npmver=${pkgver}

pkgdesc="A Modern Git UI - fresh take on ungit"
pkgver=${_npmver}
pkgrel=1
arch=("x86_64")
url="https://github.com/${pkgauthor}/${pkgname}"
license=("MIT")

depends=("glibc" "nodejs" "bun")
makedepends=("npm" "jq")

provides=("${pkgname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmauthor}/${_npmname}/-/${_npmname}-${_npmver}.tgz" "fix_cli.patch")
b2sums=('7007c5d81001529534f5970f57f0f9c50e03a67a2d8e16c831de20c1b94e44c191c37c8a5f17ccf2365a9d95c086dbe441cc6b59527dbbc3689b2119ad0bab5b'
        '25f8bbab5fa5bce10156660436a8f2044eea593403d53483fdf082244792394c5993ff82060109541732d129acc6da7931239950b895dd7a1bb4453f8c5f919b')

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

	msg2 "Patching BINARY file"
	patch "$(readlink -f ${pkgdir}/usr/bin/${pkgname})" < "fix_cli.patch"

	msg2 "Install README file"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmauthor}/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
