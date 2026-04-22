# Maintainer: Matthew Cushing <cushing.matt at gmail dot com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cushycush
_gitname=store
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Manages dotfile symlinks from a single repository without requiring a mirrored target directory layout"

pkgver=2.1.0
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
conflicts=("${_appname}"{,-git})

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
	"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.zip")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.zip")
sha256sums=('8f113f9532cf8e5524679f1f16f47cdef65a2a8e0761bc85eeb3e0a4f59b1b14'
            'c4c73cfe3e7d8e4cae57635b5d7bde8f256d5eb8e5766ce80b22b0cf3de9cca5')
sha256sums_x86_64=('3e693f553aff090fad410a65d9ce69443f2656111e8f31658426469cd529ae77')
sha256sums_aarch64=('d85bba953e3b61ce12e4e7f3ca26d6a3162b0b9be3c59aae587e119c3b7a254c')

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

	./${_appname} completion bash >${_appname}.bash
	./${_appname} completion zsh >${_appname}.zsh
	./${_appname} completion fish >${_appname}.fish
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
