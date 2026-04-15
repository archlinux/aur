# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cushycush
_gitname=store
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Manages dotfile symlinks from a single repository without requiring a mirrored target directory layout"

pkgver=1.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.zip")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.zip")
sha256sums=('1ddf75936e746381ed36d0c2c8415839ec5e61817f0278de85c2eb48339dda44'
            'c4c73cfe3e7d8e4cae57635b5d7bde8f256d5eb8e5766ce80b22b0cf3de9cca5')
sha256sums_x86_64=('607588e14e8f1085f506d809ed13eb95807c5485dfe8e685a64151595c875ae6')
sha256sums_aarch64=('a2602c2535ea6b54e9f9f089eb822c87197bc4b22bc92704aa8e1931e90b95b0')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

prepare() {
	cd "${srcdir}/" || exit

	mv "${_gitname}-${_gitversion}-${_CARCH}" "${_appname}"
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
