# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=am
_pkgauthor=sassman
_pkgbase=amoxide
_pkgname=${_pkgbase}-rs
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgbase}-bin ${_pkgbase}-tui-bin)
pkgdesc="Like direnv, but for aliases. Define aliases per project, per toolchain, or globally — and load the right ones automatically."

pkgver=0.5.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("COMPLETIONS-${pkgver}.bash::${_urlraw}/completions/bash/${_appname}.bash"
		"COMPLETIONS-${pkgver}.fish::${_urlraw}/completions/fish/${_appname}.fish"
		"COMPLETIONS-${pkgver}.zsh::${_urlraw}/completions/zsh/_${_appname}")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname%%-rs}-${_barch[0]}.tar.xz"
               "${_pkgname}-tui-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname%%-rs}-tui-${_barch[0]}.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname%%-rs}-${_barch[1]}.tar.xz"
                "${_pkgname}-tui-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname%%-rs}-tui-${_barch[1]}.tar.xz")
sha256sums=('baea335c0c35a7f4daaf6f190b8db4ee47af6867ea6f1a7c052f085cfaec5d8e'
            'fea2c218c3e3a2e08c58925c42a83748b342516ba987e448d03f70b483c3a0dd'
            '9fc069e13fd9cbb0ee4a46f086f1cc9fa8c06629a34533c8938bf162e25d26ec')
sha256sums_x86_64=('851905c466563787e3004e3c44aaa29f6738aadd3a8fa87c0ab1ddf822081b66'
                   '6785b9d0714626e7501bc95cd22e60dc95b7101a4bbb44022a30d4be85b25f08')
sha256sums_aarch64=('869909a4354128aaed896053adf00f4d1728ee3108ffae86871d71e95361b9fa'
                    '9ce4b5b3f3d9d5d5d43b0e05d18c0a3543ede65981f5b2013bb6e4fa683d07b6')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package_amoxide-bin() {
	provides=("${_appname}")
	optdepends=("${_appname}-tui")

	cd "${srcdir}/${_pkgbase}-${_CARCH}/" || exit

	install -Dm644 "../COMPLETIONS-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"
	install -Dm644 "../COMPLETIONS-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "../COMPLETIONS-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_amoxide-tui-bin() {
	provides=("${_appname}-tui")
	depends=("${_appname}")

	cd "${srcdir}/${_pkgbase}-tui-${_CARCH}/" || exit

	install -Dm755 "${_appname}-tui" "${pkgdir}/usr/bin/${_appname}-tui"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
