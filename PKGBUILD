# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=deveshctl
_gitname=layerx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal-based Docker image layer inspector"

pkgver=1.6.0
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
sha256sums_x86_64=('b5b6dc24f1f9076b0117aef00975a520e12370b37499e80d0713dc3ad378b115')
sha256sums_aarch64=('a0fabba5cdb5585a23a095ea76bd74f5e08caa1f9ece23fa5277b8ef5dfb7f68')


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
