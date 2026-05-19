# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Co-maintainer: edu4rdshl <edu4rdshl at protonmail dot com>

_npmmodule=@github/copilot

pkgname=github-copilot-cli
_pkgexec=copilot

pkgver=1.0.49
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

b2sums=('7a66551a9c20deae94f35a4e7e4740877617b789229a8f3dc2ef6a248933f035b724b0d34e679b9c9a90a3979775bdd89d3597c578ef0821775b1336fcca9fdb'
        '73bd3d7b839880754b55463df4a9035a57935d26da34e22bf44bc4b92038dc7356596df02faa43d4a5ebb2e6ef1a95ba08e6a04ca7c46827b4882446129300a4')

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

	msg2 "Generating autocompletions for Bash"
	"${pkgdir}/usr/bin/copilot" completion bash > copilot
	install -Dm644 copilot "${pkgdir}/usr/share/bash-completion/completions/copilot"

	msg2 "Generating autocompletions for Zsh"
	"${pkgdir}/usr/bin/copilot" completion zsh > _copilot
	install -Dm644 _copilot "${pkgdir}/usr/share/zsh/site-functions/_copilot"

	msg2 "Generating autocompletions for Fish"
	"${pkgdir}/usr/bin/copilot" completion fish > copilot.fish
	install -Dm644 copilot.fish "${pkgdir}/usr/share/fish/vendor_completions.d/copilot.fish"

	msg2 "Install README file"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmmodule}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	
	msg2 "Install CHANGELOG file"
	install -Dm755 "${srcdir}/CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${_npmmodule}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

