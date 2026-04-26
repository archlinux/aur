# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Nour833
_gitname=StegoForge
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="The ultimate steganography and digital forensics toolkit"

pkgver=1.1.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc' 'zlib')
provides=("${_appname}")
conflicts=("${_appname}")

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('e1bd204cdaff761d76bf5fcdfcefa22c1fee963bb20bc6b4af820a7baa49bf89'
            '0f3acd479b3a20f56204281802b5cc34cf04b439f9a897c82f685e9a776e5469')
sha256sums_x86_64=('649c62a314af463fe67760cdf9e2da5ff41e895c3a364ce3e03b026a8a8a4bad')


prepare() {
	cd "${srcdir}/" || exit

	mv "${_appname}-${CARCH}-${pkgver}" "${_appname}"
	chmod +x "${_appname}"
}

build() {
	cd "${srcdir}/" || exit

	./${_appname} completion bash > ${_appname}.bash
	./${_appname} completion zsh > ${_appname}.zsh
	./${_appname} completion fish > ${_appname}.fish
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -D -m644 "${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -D -m644 "${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -D -m644 "${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
