# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=ingit
pkgauthor=capaj
pkgver=0.4.2
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
b2sums=('793aa87963dc388b27b5d9a1d2221216baffa38b94b0dc8754431b647072d171639fe4bafdb4fde94c78b2b90f3ea164d8aaf6157c7f11c4735f9a88f452ff8b'
        '885684be2625c652f4344e50341cde0ac028904677b10be43a71d604e4b9627ed4afc46ddd15d9fabdb8d304419b062b5ba177ddbae3de62bc6df52122c5fd5e')

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
