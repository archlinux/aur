# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=marcusbandit
_gitname=newtree
_execname=nt
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern reimagining of the classic tree command with icons, color, and sane pattern filtering"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_execname}")
conflicts=("${_appname}")

depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_execname}-${pkgver}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_execname}-${pkgver}-${_barch[1]}")
sha256sums=('281d7d2c88770a870a17f2093aaaa0ce6d6212afb1bb48621855bd907167c2b6'
            'cf779b612d0897e1cb51670e1f45bbfc452be447bffffc20f8fce8a99d49d75e')
sha256sums_x86_64=('6b77c9e3ba1c9e14188920480c87c46a1c6d5ce6481cc1872ac72276961394ad')
sha256sums_aarch64=('9b8ef490d5f3eee43f863e9f0e996b96362e50e013658002af2ed91672d06cfe')


prepare() {
	cd "${srcdir}/" || exit

	mkdir -p "./completions"

	chmod +x "${_appname}-${CARCH}-${pkgver}"

	"./${_appname}-${CARCH}-${pkgver}" --generate-completions zsh > "./completions/${_appname}.zsh"
	"./${_appname}-${CARCH}-${pkgver}" --generate-completions bash > "./completions/${_appname}.bash"
	"./${_appname}-${CARCH}-${pkgver}" --generate-completions fish > "./completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_execname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_execname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_execname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
