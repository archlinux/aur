# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=deveshctl
_gitname=layerx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal-based Docker image layer inspector"

pkgver=1.5.3
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

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('0e1068675abc6d45403c0e4034a44e941883dde03be863b3191543eb3a7b5d06')
sha256sums_aarch64=('aa85f091caf3f18994c2dd94f58a6af6e8b9f4e87f2d5689778440fee2ac50e5')


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

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
