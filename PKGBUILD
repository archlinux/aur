# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=sshman
pkgauthor=eightshone
pkgver=1.0.0
pkgrel=1

_npmname=${pkgname}
_npmauthor=@${pkgauthor}
_npmver=${pkgver}

pkgdesc="A modern, interactive TUI SSH connection manager built with Node.js."
pkgver=${_npmver}
pkgrel=1
arch=("x86_64")
url="https://github.com/${pkgauthor}/${pkgname}"
license=("MIT")

provides=("${_npmname}")
makedepends=("npm" "jq")
depends=("glibc" "libgcc" "libstdc++" "bash" "libx11" "nodejs")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmauthor}/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('e93605327606b9ccb2b55d2092d35f9222643a6399e8a6aa9fd1927fd9a469185cf3a1e5869346abd7d5ecd337506f6ed3dd2bfbdffc53ccf79a976fee81824c')

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
	ln -sf "/usr/lib/node_modules/${_npmauthor}/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
