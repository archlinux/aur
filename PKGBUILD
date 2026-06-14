# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Co-maintainer: edu4rdshl <edu4rdshl at protonmail dot com>

_appname=copilot
_pkgname=${_appname}-cli
_barch=('linux-x64' 'linux-arm64')
pkgname=github-${_pkgname}-bin
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal."

pkgver=1.0.62
pkgrel=1

arch=('x86_64' 'aarch64')

license=("LicenseRef-GitHub-Copilot")

url="https://github.com/github/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/github/${_pkgname}/v${pkgver}"

provides=("${_appname}")
conflicts=("${pkgname%%-bin}" "${pkgname%%-cli-bin}")
depends=('glibc' 'libgcc' 'nodejs' 'glib2' 'libsecret')

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"CHANGELOG-${pkgver}.md::${_urlraw}/changelog.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('33657f2e7383f2167b47d5f8c549a6071905a5c93d5d67d17e5c5399f126f07b'
            '31e5a006afc79f9eff52bc2ad8d0132149730228ce20eb01a517a433457d91a0'
            '1fbd0dcc55c66738b1b591632132c927de20c8443dff1d55b4851e378883e402')
sha256sums_x86_64=('cbb4a400c86a187631ded6bf8177aadf9f2886fca5a9e27998449151a28cf3c8')
sha256sums_aarch64=('099ca091e3bfa510d0b22365c4da4d04ac14c9c691de2dd39b1075e2a8c48fca')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	msg2 "Generating autocompletions for Bash"
	"${pkgdir}/usr/bin/copilot" completion bash > copilot
	install -Dm644 copilot "${pkgdir}/usr/share/bash-completion/completions/copilot"

	msg2 "Generating autocompletions for Zsh"
	"${pkgdir}/usr/bin/copilot" completion zsh > _copilot
	install -Dm644 _copilot "${pkgdir}/usr/share/zsh/site-functions/_copilot"

	msg2 "Generating autocompletions for Fish"
	"${pkgdir}/usr/bin/copilot" completion fish > copilot.fish
	install -Dm644 copilot.fish "${pkgdir}/usr/share/fish/vendor_completions.d/copilot.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

