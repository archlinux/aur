# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=tianchangNorth
_gitname=curlmgr
_appname=${_gitname}
_execname=cm
pkgname=${_appname}-bin
pkgdesc="A lightweight CLI package manager for command-line tools distributed through direct URLs, GitHub Releases, local manifests, or explicit install scripts"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_execname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('7953afe94207a5a968b645986ba63983844fe43e820cd9956096b311df547a7e')
sha256sums_aarch64=('8296be510dc80b778a6b9e74758e3b4905a18ba6ffd92279af5f56ce6c4ef09b')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

build() {
	cd "${srcdir}/${_appname}_${pkgver}_${_CARCH}/" || exit

	./${_execname} completion bash > ${_appname}.bash
	./${_execname} completion zsh > ${_appname}.zsh
	./${_execname} completion fish > ${_appname}.fish
}

package() {
	cd "${srcdir}/${_appname}_${pkgver}_${_CARCH}/" || exit

	install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -D -m644 "${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_execname}"
	install -D -m644 "${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_execname}"
	install -D -m644 "${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_execname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
