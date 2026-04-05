# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AmalChandru
_gitname=termtrace
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal workflow recorder that turns debugging sessions into replayable, shareable artifacts"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_gitversion}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_gitversion}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('e6661265933dbfd28df950dc46e3a610f4b7664e4ab5a72ecad1348aedb6c6fd')
sha256sums_aarch64=('fb79d267ab63c7912cf41eb065775821fc2cc2cfee2bf64a3452e0a347828c29')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

build() {
	cd "${srcdir}/${_appname}_${_gitversion}_${_CARCH}/" || exit

	./${_appname} completion bash > ${_appname}.bash
	./${_appname} completion zsh > ${_appname}.zsh
	./${_appname} completion fish > ${_appname}.fish
}

package() {
	cd "${srcdir}/${_appname}_${_gitversion}_${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
