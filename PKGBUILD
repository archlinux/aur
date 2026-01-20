# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=github-copilot-cli
_pkgexec=copilot

pkgver=0.0.386
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

b2sums=('2226e99202cda2fb2f671a72520e7271c44d1ca76f7c0b77932f9a6774ac050c1d4108e0f0818f1b987a725199081281e72e0b865170309a0098e5136d713c1a'
        '7fcfacf55bde24056fb58a25e63b33b679d0a8869021e8682c48bbd5b126bbd29d268c3c300cf298a88373cceb528cdcf22d4ac6037514d5cd54b0facc8c553d'
        '3051978194208265bd74e339e9095e4b522d953c18163485418013e0bb907c33a39ff525a3796a9fd5086d432eb61ab04f71bc917dfce8d33c04cf73bb766a48')

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
