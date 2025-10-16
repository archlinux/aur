# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=github-copilot

pkgver=0.0.343
pkgrel=1

pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal."

url="https://github.com/github/copilot-cli"
_urlraw="https://raw.githubusercontent.com/github/copilot-cli/v${pkgver}"

depends=("bash" "nodejs")
makedepends=("npm" "jq")
provides=("${pkgname}")

arch=("x86_64")
options=(!strip emptydirs staticlibs zipman)

license=("GitHub")

source=("https://registry.npmjs.org/@github/copilot/-/copilot-${pkgver}.tgz"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
noextract=("copilot-${pkgver}.tgz")
changelog="changelog.md"

b2sums=('26f9ab0f4ce45b8d2eacc078439a849cf9dad78cfa5d471b46e56fdc818d3ca87a5161849bd05feb865ee6fa644e77acc11a6679bc0bf4d9f468ac687305c5a2'
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
