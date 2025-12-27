# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=stonks-dashboard
_npmver=1.0.2

pkgname=${_npmname}
pkgdesc="Minimal real-time market dashboard for your terminal"
pkgver=${_npmver}
pkgrel=1
arch=("x86_64")
url="https://www.npmjs.com/package/stonks-dashboard"
license=("MIT")

replaces=("nodejs-${_npmname}")
depends=("glibc" "nodejs")
makedepends=("npm" "jq")
provides=("${_npmname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('8b7b9c52518a5d3d6160c2170439a51cdea744bc914581da874925cc45b8e7e8d8cc50657afe05c99feafab4b7f7ce7341e44527155720dcab44c8dec30e0554')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
prepare() {
	cd ${srcdir}

	touch "cache.json"
}

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
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	msg2 "Install CACHE file"
	install -Dm777 "${srcdir}/cache.json" "${pkgdir}/usr/lib/node_modules/${_npmname}/"
}
