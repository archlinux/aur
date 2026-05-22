# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=minesweeper-tui
pkgdesc="A Vim-friendly Minesweeper TUI"
pkgver=0.3.1
pkgrel=1

_npmname=${pkgname}
_npmver=${pkgver}

arch=("x86_64")
url="https://github.com/Pansther/minesweeper-tui"
_urlraw="https://raw.githubusercontent.com/Pansther/minesweeper-tui/v${pkgver}"
license=("MIT")

depends=("nodejs" "python")
makedepends=("npm" "jq")

conflicts=("${pkgname}-bin")
provides=("${_npmname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('fb99ae602ee91006ea1c196d9afeb3446e0f85550ee3d90b318892dc2327fa1cf78a35339b16751d890037c3f46bb3a1def6c4378ae0ca4f11515316ce84f8e9')

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

	msg2 "Fix binary name"
	mv "${pkgdir}/usr/bin/${pkgname%%-tui}" "${pkgdir}/usr/bin/${pkgname}"

	msg2 "Install README file"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
