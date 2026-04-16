# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Co-maintainer: edu4rdshl <edu4rdshl at protonmail dot com>

_npmmodule=@github/copilot

pkgname=github-copilot-cli
_pkgexec=copilot

pkgver=1.0.30
pkgrel=1

pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal."

url="https://github.com/github/copilot-cli"
_urlraw="https://raw.githubusercontent.com/github/copilot-cli/v${pkgver}"

arch=("x86_64")

license=("LicenseRef-GitHub-Copilot")

conflicts=("${pkgname%%-cli}" "${pkgname}-legacy")
depends=("glibc" "gcc-libs" "nodejs" "glib2" "libsecret")
replaces=("${pkgname%%-cli}")
makedepends=("npm" "jq")
provides=("${_pkgexec}")

options=(!strip emptydirs staticlibs zipman)

source=("https://registry.npmjs.org/${_npmmodule}/-/copilot-${pkgver}.tgz"
		"CHANGELOG-${pkgver}.md::${_urlraw}/changelog.md")
noextract=("copilot-${pkgver}.tgz")

b2sums=('dbefbe097af4539698eecaa45a776028d2e1edd8320c957d690c900a365c7ebee5b610b875443b109ccb53996e7236939bea85e7d98faeebe9bc2a3d326e6fbb'
        'ec28ede68725d6d194ae9ab79c83d408ba573d9df587259adfe39a00d0aa22be9eafdc45cd9cadf4b4848b82ad82bf8ad5263f3a15cf90e7f98b488b1372a33d')

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
	local pkgjson="${pkgdir}/usr/lib/node_modules/${_npmmodule}/package.json"
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

	msg2 "Install README file"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmmodule}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	
	msg2 "Install CHANGELOG file"
	install -Dm755 "${srcdir}/CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmmodule}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

