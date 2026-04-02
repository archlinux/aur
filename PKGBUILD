# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=am
_pkgauthor=sassman
_pkgbase=amoxide
_pkgname=${_pkgbase}-rs
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgbase}-bin ${_pkgbase}-tui-bin)
pkgdesc="Like direnv, but for aliases. Define aliases per project, per toolchain, or globally — and load the right ones automatically."

pkgver=0.3.0
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
sha256sums=('6bbac0ebe716461898cd38a03b7e22c15f33dc7849de54f3210a43e9c175d7c5'
            '2069496a3e34d3a3dc4d5001070ecec7ca7148223e4e611bddae480bc37b18c4'
            '048ad2ed6bec5a836b063becfa004a0a4818239189522dc4ef309e6aee26a95c')
sha256sums_x86_64=('cf4056d107a397276dc91330c25673dbda2d13c75ecca86007f6787bfa755b9d'
                   '6852b8bf96f9a8d687b824d5fd025b9ea7330808ca29853e5acffbaf4e0a0cf7')
sha256sums_aarch64=('9537fa0f62f43b1296c8c1f4ff7faf907774ab5de8d9dfec51d462b372f19468'
                    '08045db282549692ef992ad0f8d481c7c8303d64ef7223616852c3bd0d24bd97')


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
