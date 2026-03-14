# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=pastevault
_npmver=0.1.6

pkgname=${_npmname}
pkgdesc="Modern secure pastebin with a VS Code-like editor. Share code, text, and markdown securely with automatic expiry and burn-after-read options."
pkgver=${_npmver}
pkgrel=1
arch=("x86_64")
url="https://github.com/arc53/pastevault"
_urlraw="https://raw.githubusercontent.com/arc53/pastevault/v${pkgver}"
license=("GPL-3.0")

depends=("glibc" "libgcc" "libstdc++" "zx" "nodejs" "bash")
makedepends=("npm" "jq")
provides=("${_npmname}")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz"
		"pastevault.service")
b2sums=('8266dfcc4613a030fa26b18f6d204e4207cc837179da1e93b89640066b2e217bf05e8a7239b6ccf361b0efd1db8ebc73586b1fcf7ded01b5dd94d0e9ceb3de67'
        '3eaaa551692edc7daef740c95fda8efe11f002d35aa260ef41bac7d335b4bfb1eed4b6962fd25c9772b734fe73f8614dac1edfc08c411dcdb4cf5e1466550561')

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

	msg2 "Install SYSTEMD files"
	install -Dm644 "pastevault.service" -t "${pkgdir}/usr/lib/systemd/system/"

	msg2 "Install README file"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
