# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cvlmtg
_gitname=HUME
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A selection-first modal text editor for the terminal, scriptable in Scheme"

pkgver=0.20.1
pkgrel=1
_gitversion=v${pkgver}
_gitcommit=$(gh api repos/${_gitauthor}/${_gitname}/git/tags/$(gh api repos/${_gitauthor}/${_gitname}/git/ref/tags/${_gitversion} --jq '.object.sha') --jq '.object.sha[0:9]')

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_gitcommit}-${_barch[0]}.tar.gz")
sha256sums=('a91b8cbe285872ab630abd95c5a6042ea56af7d8a630343746ecc8e0cfe0a35f'
            'e10b2e23fc9874c2f8c7ddac5d9a3f1123f5149ffed33ce598166f54febf66b2')
sha256sums_x86_64=('6f4928dfe72c6b99b048eaa6969d5a8271907360785bdb71b89577aca563e064')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_gitcommit}-${_CARCH}/" || exit

	install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/"
	cp -rfa "share/${_appname}" "${pkgdir}/usr/share/"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
