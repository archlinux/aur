# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="coil-cli"
pkgdesc="See your NVIDIA GPU in real time — a beautiful, live-updating TUI replacement for nvidia-smi"
pkgver=0.3.0
pkgrel=1

arch=("x86_64")
license=("MIT")

url="https://github.com/Jettsondev/coil-cli"
_urlraw="https://raw.githubusercontent.com/Jettsondev/coil-cli/v${pkgver}"

_npmname=${pkgname}
_npmver=${pkgver}

provides=("${_npmname%-cli}")

makedepends=("npm" "jq")
depends=("glibc" "libgcc" "libx11" "nodejs" "python")

options=(!strip emptydirs staticlibs zipman)
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
b2sums=('e66c610dda8c40c3c959e673e343bdf56821bdf16108d3dd7e36e0020d0b728eadcfc65b39bc1d92e68af25d6a3980f2bcf24da2dc0d1dd2fb024e41546c185f')

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
