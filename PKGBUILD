# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=terminal-ai
pkgauthor=dwmkerr
pkgver=0.14.0
pkgrel=1

_npmname=${pkgname}
_npmauthor=@${pkgauthor}
_npmver=${pkgver}

pkgdesc="Unopinionated AI for the Shell. A lightweight AI CLI for scripts, pipelines, and automation, with a universal client for MCP, A2A, and other AI protocols."
pkgver=${_npmver}
pkgrel=1
arch=("x86_64")
url="https://github.com/dwmkerr/terminal-ai"
license=("MIT")

provides=("${_npmname##terminal-}")

depends=("glibc" "nodejs" "bash" "python" "libx11")
makedepends=("npm" "jq")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmauthor}/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('c8bc3ff775149a305eb0d1435ab723e05d4910bf1650cf999dd0c162b0951f3ee73206241e5959878b97153d3a297ccff7ecb8c6b58037581c75ca8609d50e33')

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
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
