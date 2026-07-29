# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=versenilvis
_gitname=IRIS
_appname=${_gitname,,}
pkgname=${_appname}-autocomplete-bin
pkgdesc="Shell auto-completion tool that works like code editors IntelliSense."

pkgver=0.4.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('0BSD')

depends=('glibc')
provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("GUIDE-${pkgver}.md::${_ghurlraw}/docs/README.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums=('5dea55cfe86d51ff05b8a0eaa07777dfbb0931e44277cbbfe31366cfec05c424'
            'fc91adf6ac1a6666ec57faa8f2c26b1dd6a7973515a3892fef11dd64286a78eb'
            '0db3336be1d50c18d8d0f844a996cdddaf66a018dbdee58ab94933c1c6ffc2e9')
sha256sums_x86_64=('bb7b2567715f9ff83148b590cdb5e569eabc18bbc09051e3c8521f9fee20c6d8')
sha256sums_aarch64=('beed1535ea1bc13407454db0ba4042fc7cc0107774157f314e590b8074485faf')


build() {
	cd "${srcdir}/" || exit

	mkdir -p completions
	./"${_appname}" completion zsh > "completions/${_appname}.zsh"
	./"${_appname}" completion bash > "completions/${_appname}.bash"
	./"${_appname}" completion fish > "completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "GUIDE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/GUIDE.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
