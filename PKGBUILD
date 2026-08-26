# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=nanocoder
pkgauthor=Nano-Collective
pkgver=1.30.0
pkgrel=1

_npmname=nanocoder
_npmauthor=@nanocollective

pkgdesc="A beautiful local-first coding agent running in your terminal"
arch=("x86_64")
url="https://github.com/${pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${pkgauthor}/${pkgname}/v${pkgver}"
license=("MIT")

provides=("${pkgname}")
replaces=("nodejs-${pkgname}")

makedepends=("npm" "jq")
depends=("bash" "nodejs" "yarn" "libx11")

options=(!strip emptydirs staticlibs zipman)
changelog="changelog.md"

source=("https://registry.npmjs.org/${_npmauthor}/${_npmname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")

b2sums=('b36901853cdb8306019be5c569bff02a3f40a026df862e586fc36fecd98e6b030c417777dd0650fb8dec7451899df312d8531ac402dcca073c7e41150c982862')

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
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmauthor}/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmauthor}/${_npmname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
