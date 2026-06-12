# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="git-archaeologist"
pkgdesc="Find the most dangerous files in any git repo — curse scores, bus factor, hidden coupling. Used to analyze 26 major OSS projects."
pkgver=1.9.5
pkgrel=1
arch=("x86_64")
url="https://github.com/SushantVerma7969/git-archaeologist"
_urlraw="https://raw.githubusercontent.com/SushantVerma7969/git-archaeologist/v${pkgver}"
license=("MIT")

_npmname=${pkgname}
_npmver=${pkgver}
_appname=git-arch

depends=("nodejs" "git")
makedepends=("npm" "jq")
provides=("${_appname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('4387c40d58335e5778494389561ac1e3c4d28b2a1bbe25a3b2aebe3640f7b4bf7339fc2aa0f0f82a1f152f843884bfa18c36c77e2f3800cb6db8037a055adc1c')

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
