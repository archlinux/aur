# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=zouyonghe
_pkgname=PixelTerm-C
_appname=pixelterm
pkgname=${_appname}-c-bin
pkgdesc="A high-performance terminal image/video/book browser written in C, based on the Chafa library"

pkgver=1.8.2
pkgrel=2
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64-linux')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('LGPL-3.0-or-later')

provides=("${_appname}")
replaces=("${_appname}-bin")
conflicts=("${_appname}"{,-c,-bin})

makedepends=('xdelta3')
depends=('glibc' 'glib2' 'gdk-pixbuf2' 'chafa' 'ffmpeg' 'libmupdf')

source=("FIX_FFMPEG.delta"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"${_appname}-${pkgver}.ZSH::${_urlraw}/completions/zsh/_${_appname}"
		"${_appname}-${pkgver}.BASH::${_urlraw}/completions/bash/${_appname}"
		"${_appname}-${pkgver}.FISH::${_urlraw}/completions/fish/${_appname}.fish")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('2b0746233ed1e28962ead434325f1c775bc846f54ef49d34cabc4dca63660a30'
            'a30b218bb0c27aa7264ea96b9bdbff18fb52702ad35d44212bcf019c391f83e5'
            '63ed0add7e04b68132eff09f36d5e8943aa8cd64c3e1090ff92849a110b8b213'
            'fb775cf18c7c7461d35e65d3375832d61f5df062abab526532c5821ed13f213e'
            'f2be33e527d535e742bd67d3f4a334d492506664d4dfe809512237c9b98b5c1c'
            '3a5d806117395da68bdbfdd293ad624d3e4ba2e1c52d381c47d10566968ab64b')
sha256sums_x86_64=('5375a733ead5cc19bfc0f3b9424e8f38439a097b50ed4ae1d6b2d62d6464ed36')


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

	xdelta3 -d -f -s "${_appname}-${_CARCH}" "FIX_FFMPEG.delta" "${_appname}-${_CARCH}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}-${pkgver}.ZSH" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "${_appname}-${pkgver}.BASH" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "${_appname}-${pkgver}.FISH" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
