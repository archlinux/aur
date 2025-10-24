# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=github-copilot-cli
_pkgexec=copilot

pkgver=0.0.351
pkgrel=1

pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal."

url="https://github.com/github/copilot-cli"
_urlraw="https://raw.githubusercontent.com/github/copilot-cli/v${pkgver}"

depends=("glibc" "gcc-libs" "glib2" "libsecret" "lib32-glibc" "lib32-gcc-libs" "lib32-glib2")
conflicts=("${pkgname%%-cli}" "${pkgname}-legacy")
replaces=("${pkgname%%-cli}")
makedepends=("npm" "jq")
provides=("${_pkgexec}")

arch=("x86_64")
options=(!strip emptydirs staticlibs zipman)

license=("LicenseRef-GitHub")

source=("https://registry.npmjs.org/@github/copilot/-/copilot-${pkgver}.tgz"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
		"README-${pkgver}::${_urlraw}/README.md")
noextract=("copilot-${pkgver}.tgz")
changelog="changelog.md"

b2sums=('2036e7c3d4eb83d23dd9199202d96c68d87cf0fbbd54bc88512edc7b5f88999ca630a1e1f0c5faec1dec1de3af8f602c3e50d5be17450e17f45bb4a71e309ded'
        '4f1ae6117d08e8e0a9b3bb838970059dcfa151b5f8764bb7d62e320b72570fccb7ac209011ba6778b5e9895ee586bdbbb190e5ff97b7b10cd14eee0f80caee35'
        'b8437e4bcac71d24c1a58690e767bafbdeb97abe690c40d1721c31ae4e0127fd780ed4f72e08f7c83638668df73379832709dbbb6fad5343eb709d47ba7d1951')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	msg2 "Install using Using NPM"
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/copilot-${pkgver}.tgz"

	msg2 "Fix ownership of ALL FILES"
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	msg2 "Remove references to PKGDIR"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	msg2 "Fixing 'package.json'"
	local tmppackage="$(mktemp)"
	local pkgjson="${pkgdir}/usr/lib/node_modules/@github/copilot/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
	mv "${tmppackage}" "${pkgjson}"
	chmod 644 "${pkgjson}"

	msg2 "More fixes for 'package.json'"
	find "${pkgdir}" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "${pkgjson}" > "${tmppackage}"
		mv "${tmppackage}" "${pkgjson}"
		chmod 644 "${pkgjson}"
	done

	msg2 "Installing README.md"
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@github/copilot/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Installing LICENSE"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
