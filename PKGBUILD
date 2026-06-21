# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=xcute
pkgname=${_appname}
pkgdesc="Execute reusable command workflows from a single CLI"
pkgver=0.10.3
pkgrel=1
arch=("x86_64")
url="https://github.com/HichemTab-tech/xcute"
_urlraw="https://raw.githubusercontent.com/HichemTab-tech/xcute/v${pkgver}"
license=("MIT")

depends=("bash" "nodejs" "python" "python-packaging" "python-pkg_resources" "python-typing_extensions" "gyp")
optdepends=("powershell")
makedepends=("npm" "jq")
provides=("${_appname}")

_npmname=${pkgname}-cli
_npmver=${pkgver}

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

# source=("${pkgname}-${pkgver}.tgz::${url}/archive/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('53c36bf5c15f06003f8b851adeac30f8e42c4c384a6acace082fefa3410cf7b7ba6f9502f8da1616558b20f0bb4e1dabb562f317a1664b5d2606abfc51872997')

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
