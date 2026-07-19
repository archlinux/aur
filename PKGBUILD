# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=pastevault
pkgname=${_appname}-server
pkgver=0.1.6
pkgrel=1
pkgdesc="Modern secure pastebin with a VS Code-like editor. Share code, text, and markdown securely with automatic expiry and burn-after-read options. (SERVER)"

_npmname=${_appname}
_npmver=${pkgver}

arch=("x86_64")
license=("GPL-3.0")

url="https://github.com/arc53/${_appname}"
_urlraw="https://raw.githubusercontent.com/arc53/${_appname}/v${pkgver}"

provides=("${_npmname}-server")

makedepends=("npm" "jq")
depends=("glibc" "libgcc" "libstdc++" "zx" "nodejs" "bash")

options=(!strip emptydirs staticlibs zipman)
backup=("etc/${_appname}/${_appname}.env")
noextract=("${pkgname}-${pkgver}.tgz")

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz"
		"${_appname}.service" "${_appname}.env" "${_appname}.sysusers" "${_appname}.tmpfiles")
b2sums=('8266dfcc4613a030fa26b18f6d204e4207cc837179da1e93b89640066b2e217bf05e8a7239b6ccf361b0efd1db8ebc73586b1fcf7ded01b5dd94d0e9ceb3de67'
        '266caf60954c157beecb65786beac41a31f2f887e434e7158a54c28d39c67251012e59d53e359ac5db24353c4edc373b2e87e865e87e6ac3e2507640cc393332'
        'b1d5e38794d04a798d3a667307f4ca5e131c8c647494e980c5be69f15dc9cd69f4e47c3b4843976f081621e48720b8ce9eeb7ac00653ad5c5e3bb2b48234445b'
        '14f96390c7a0f12ed66bf4fb016002cb60109a43886a65e327df68662da6764498ac1efe548eb864c50896a4f8a56fb14b9040c6588d0d9693ca4d62129e78a5'
        '84823a23de928257a83699ca58f5a96c620935576e6404c89e370b00690268296f5306f16af70f682b4b8216c23941cf57b32b47d93d18017a7c4f357b962d05')

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

	msg2 "Fixing EXECUTABLE file"
	mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}-server"

	msg2 "Install SYSTEMD files"
	install -Dm644 "${_appname}.service" -t "${pkgdir}/usr/lib/systemd/system/"

	install -Dm644 "${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
	install -Dm644 "${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"

	msg2 "Install CONFIG files"
	install -Dm644 "${_appname}.env" -t "${pkgdir}/etc/${_appname}/"

	msg2 "Install README file"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
