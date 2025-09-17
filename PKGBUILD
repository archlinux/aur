# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=artemis-lang
_npmsub=cli
pkgname=$_npmname
pkgver=0.3.3
pkgrel=1

pkgdesc="TypeScript-Powered Scripting Language"
arch=("x86_64")
url="https://github.com/chaqchase/artemis"
_urlraw="https://raw.githubusercontent.com/chaqchase/artemis/@artemis-lang/cli@${pkgver}"
license=("MIT")
replaces=("nodejs-${_npmname}")
depends=("nodejs")
makedepends=("npm" "jq")
provides=("$_npmname")

options=(!strip emptydirs staticlibs zipman)
noextract=("${_npmname}-${pkgver}.tgz")

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/@${_npmname}/${_npmsub}/-/${_npmsub}-${pkgver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
b2sums=('2bcf75ba79f7fb97d937a55b734519125409ea65238667c0c240d1a7c6b3f87f894b2506f4e3dca25eaa63dd113be7d1d4414447e1b30f2102d6604196c0a1b6'
        '4e70d2d4421dfa3a9ab7cdc07199e26c605d2d80b138c5674497708c5a780b3727a14f3ae38eecf419f9dc5f2b35626da92746778f0614da1727a0dd4331e298'
        '26d0c38dc2a158ab297c8b83b12d6b6cf95b889fb6467b970fb22dd7add0bbe67a59d5dd5b4cdc92e328437d524c720d8dcc1ec888f4d9bd2d7020d4e69b90a4')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	# Install using Using npm
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${_npmname}-${pkgver}.tgz"

	# Fix ownership of ALL FILES
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="${pkgdir}/usr/lib/node_modules/@${_npmname}/${_npmsub}/package.json"
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
