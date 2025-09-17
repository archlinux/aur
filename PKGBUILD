# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_npmname=gritty
pkgname=$_npmname
pkgver=8.1.2
pkgrel=1

pkgdesc="Web Terminal Emulator."
arch=("x86_64")
url="https://github.com/cloudcmd/gritty"
_urlraw="https://raw.githubusercontent.com/cloudcmd/gritty/v${pkgver}"
license=("MIT")

replaces=("nodejs-${_npmname}")
depends=("glibc" "gcc-libs" "bash" "nodejs" "python")
makedepends=("npm" "jq")
provides=("$_npmname")

options=(!strip emptydirs staticlibs zipman)
noextract=("${_npmname}-${pkgver}.tgz")
changelog="changelog.md"

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
b2sums=('9622863f4ae2d5a2126043b916efbf87d26893ab1deefe2bac302aba93175f3315b5f2f831565d69333394b8e07fb5e6bbfed8c7e29936b4e8e834ebe8df9de7'
        'cb174547e3bf5bf00fb3a91b97435416ad265ebf98d30e86c49188113878530bc2db7592d91ee182a471a499ce1c00308eeedc7088ea3403ec21073471cca46e'
        'a9b8c1a337809b1a067c6749e8b488770254bf5bf81e74b20847e9ae382cabf7f11143e1b0cc9c8f57d5d4ced6b95a44cf1e94e2aef4e589afc2914aa5faca4a')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	# Install using Using npm
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${_npmname}-${pkgver}.tgz"

	# Fix ownership of ALL FILES
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
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

	# Install README file
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Install LICENSE file
	install -Dm 644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
