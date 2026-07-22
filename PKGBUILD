# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Tommy Falkowski <tommy@byteowlz.com>

_gitauthor=byteowlz
_gitname=sx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Multi-engine web search from the command line"

pkgver=2.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('5a11846b841819f3d45df2d7fc3915c6648d0f13665d7f4db7dbc7924f4d04a0'
            '647221b987aeb9a07979d10ff7ca51dea253d3baca226aee75838f7f72b72bf1')
sha256sums_x86_64=('668c920d27f32d27d4226b3ac1816820bc22da1c8356714af1820c392c7c66af')
sha256sums_aarch64=('2a69bc7af43511f7c3b822e682a79db0b40c1080da60929754401b8faa33775c')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

build() {
	cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

    mkdir -p completions
    ./"bin/${_appname}" completion zsh > "completions/${_appname}.zsh"
    ./"bin/${_appname}" completion bash > "completions/${_appname}.bash"
    ./"bin/${_appname}" completion fish > "completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
    install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
    install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
