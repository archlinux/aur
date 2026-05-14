# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=am
_pkgauthor=sassman
_pkgbase=amoxide
_pkgname=${_pkgbase}-rs
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgbase}-bin ${_pkgbase}-tui-bin)
pkgdesc="Like direnv, but for aliases. Define aliases per project, per toolchain, or globally — and load the right ones automatically."

pkgver=0.9.0
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
sha256sums=('2218976034d609d5d26a0bf548dafd42b6afd93c16e829759f3bf3a377670114'
            'b30ce288346d00033733d4a7342a262a92ff85b8098797a31ff5544e51e147bc'
            '3b5c26c636a9aa70db6303cf788dbd72c99380683079014baba0c4b7d83b6499')
sha256sums_x86_64=('1f8af707bae004072610d589515c1f5529a52776545f0d8cb38e84325153dd8c'
                   '11c627e98652fea4e018358d57bfcab0033f8bd2a6876ba196d49a6da7c8c1e8')
sha256sums_aarch64=('b7b878c7ed0a46a166d14dd9673d3b2b54c175988c3e3cc26f73d237db2a9b90'
                    '2204258bdb14c4ba92b798f3cd329c8b31eb55d495089c6afa40141e0fb56bdd')


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
