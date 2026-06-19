# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=epiq
pkgdesc="CLI based issue tracker TUI - distributed and backed by git"
pkgver=0.7.4
pkgrel=1
arch=("x86_64")
url="https://github.com/ljtn/epiq"
_urlraw="https://raw.githubusercontent.com/ljtn/epiq/v${pkgver}"
license=("LicenseRef-UNLICENSE")

_npmname=${pkgname}
_npmver=${pkgver}

replaces=("nodejs-${_npmname}")
depends=("glibc" "nodejs")
makedepends=("npm" "jq")
provides=("${_npmname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('24e029994e70ac943e29285a80e771ce539ca4e1946c155c77294db91d9f4ffb4eeccfb2f79d7a87f632f5d2243b30d7e52959169631d724c03b8d398a21a1b3')

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
	ln -sf "/usr/lib/node_modules/${_npmname}/readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
