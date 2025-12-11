# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=github-copilot-cli
_pkgexec=copilot

pkgver=0.0.369
pkgrel=1

pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal."

url="https://github.com/github/copilot-cli"
_urlraw="https://raw.githubusercontent.com/github/copilot-cli/v${pkgver}"

conflicts=("${pkgname%%-cli}" "${pkgname}-legacy")
depends=("glibc" "gcc-libs" "nodejs" "glib2" "libsecret")
replaces=("${pkgname%%-cli}")
makedepends=("npm" "jq")
provides=("${_pkgexec}")

arch=("x86_64")
options=(!strip emptydirs staticlibs zipman)

license=("LicenseRef-GitHub")

source=("https://registry.npmjs.org/@github/copilot/-/copilot-${pkgver}.tgz"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
noextract=("copilot-${pkgver}.tgz")
changelog="changelog.md"

b2sums=('f1699cba5e106d0529e7a89c9f10ae76405986e375bbfba04eccb131b95a4a3aa4cc8c42bcd02c66753f357db27c959e1094e52a48a0a930f2657375ed9aa78c'
        '37cd5d9ebbd23a2f11b56daa28210c2251713a015901ae026f41d414d8bf86574195cfed5a05612aa4e508e9ec318d3d778dd4c9a605936bc9128c15aefa9afe'
        '4f1ae6117d08e8e0a9b3bb838970059dcfa151b5f8764bb7d62e320b72570fccb7ac209011ba6778b5e9895ee586bdbbb190e5ff97b7b10cd14eee0f80caee35')

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
