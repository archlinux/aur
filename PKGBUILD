# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jongio
_gitname=grut
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal file explorer with full Git and GitHub integration, AI chat, and reactive panels that stay in sync as you navigate"

pkgver=0.10.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('git' 'github-cli')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('46d8bdfe950373d4698c550b32a6533f8c5f6e66a49d60b085657c82c15d8486')
sha256sums_aarch64=('cfd51e2ad4620a7ecb4b324945931512bcfd7ac560a756b6ea9753a395dc4746')


prepare() {
	cd "${srcdir}/" || exit

	mkdir -p "./completions"

	chmod +x "${_appname}"

	"./${_appname}" completion zsh > "./completions/${_appname}.zsh"
	"./${_appname}" completion bash > "./completions/${_appname}.bash"
	"./${_appname}" completion fish > "./completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
