# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Co-maintainer: edu4rdshl <edu4rdshl at protonmail dot com>

_npmmodule=@github/copilot

pkgname=github-copilot-cli
_pkgexec=copilot

pkgver=1.0.27
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

b2sums=('c1336262abeb11846bc3bb9075bd3a77b4cdbf2b08549bb4d1dd9ce31612555f4cca0a36a618217b5589a6198d4da3bfe6d0eeb4d02d5c9b8623fd4ac863add0'
        'e4a354f16bf1042a799829621022c21d05dd40dede60066c72baee9b8364a01fce23ab1df8b89e404cd64406aac8205de3ddeedd7b71d22ae9655c89e429022a')

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

