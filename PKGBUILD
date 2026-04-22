# Maintainer: Matthew Cushing <cushing.matt at gmail dot com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cushycush
_gitname=store
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Manages dotfile symlinks from a single repository without requiring a mirrored target directory layout"

pkgver=2.4.0
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
sha256sums=('2231cdc046f437b96ac092ac28228ae5011d0a1b640e1c8fdd5cbf53691a8afb'
            'c4c73cfe3e7d8e4cae57635b5d7bde8f256d5eb8e5766ce80b22b0cf3de9cca5')
sha256sums_x86_64=('dabeac63c4d2179687e6f3e74b123636fd030dc0e2de1ccef2e751b696f359e4')
sha256sums_aarch64=('c25600e9f7f6b08fd6ccce195f3397c5f6e52a0f2544797f1be07da16c3e1789')

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
