# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="merlin-commit"
pkgdesc="🧙‍♂️ Magical, interactive CLI for creating conventional commits"
pkgver=1.0.0
pkgrel=1
arch=("x86_64")
license=("MIT")
url="https://github.com/mBukator/merlin-commit"
_urlraw="https://raw.githubusercontent.com/mBukator/merlin-commit/v${pkgver}"

_npmname=${pkgname}
_npmver=${pkgver}

depends=("nodejs" "git")
makedepends=("npm" "jq")
provides=("${_npmname}" "${_npmname%%-commit}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('b51aea2b2c82614a08d628a17e600c20503218d81399684c9f4c1a7ecd3cde007404732765f4ce406571ca930c800d2c5c83980d2042d74e794e5546fdf1e816')

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
	ln -sf "/usr/lib/node_modules/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
