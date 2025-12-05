# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=cloudcmd
_npmver=19.0.16

pkgname=${_npmname}
pkgdesc="Cloud Commander file manager for the web with console and editor."
pkgver=$_npmver
pkgrel=1
arch=("x86_64")
url="https://github.com/coderaiser/cloudcmd"
_urlraw="https://raw.githubusercontent.com/coderaiser/cloudcmd/v${pkgver}"
license=("MIT")
replaces=("nodejs-${_npmname}")
depends=("glibc" "nodejs" "python")
makedepends=("npm" "jq")
provides=("${_npmname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")
changelog="changelog.md"

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('362d4286e7cb2483863ae7607cd0df1cc921cad33b08da8265af0da62086c0d74d07c2e88e0d27ea10b361abd31f16c55645fff373793a840cb0d77a0a5cf93d')

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

	msg2 "Install man page"
	install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

	msg2 "Install README file"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
