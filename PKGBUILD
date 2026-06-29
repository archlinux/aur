# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=am
_pkgauthor=sassman
_pkgbase=amoxide
_pkgname=${_pkgbase}-rs
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgbase}-bin ${_pkgbase}-tui-bin)
pkgdesc="Like direnv, but for aliases. Define aliases per project, per toolchain, or globally — and load the right ones automatically."

pkgver=0.10.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

conflicts=("${_pkgbase}")
depends=('glibc' 'libgcc')

source=("COMPLETIONS-${pkgver}.bash::${_urlraw}/completions/bash/${_appname}.bash"
		"COMPLETIONS-${pkgver}.fish::${_urlraw}/completions/fish/${_appname}.fish"
		"COMPLETIONS-${pkgver}.zsh::${_urlraw}/completions/zsh/_${_appname}")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname%%-rs}-${_barch[0]}.tar.xz"
               "${_pkgname}-tui-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname%%-rs}-tui-${_barch[0]}.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname%%-rs}-${_barch[1]}.tar.xz"
                "${_pkgname}-tui-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname%%-rs}-tui-${_barch[1]}.tar.xz")
sha256sums=('d43a9a2755a71ef56d9c166f1f01132fd140cde6edeedede5120c237361750bb'
            'd5802afa6d54d23d63c2e26340df46645a98785f25b226aaf67691e193b7a2f6'
            '3666c4af9d1843c78f59b20c3a5082f8d159ed114bb49b480547a82cd23fd4ed')
sha256sums_x86_64=('532b1c4ae0be39efbb6a350edaa88efcd493d760f2ea8b31584cb3a4dc92ecce'
                   'a7f3bf1044868072a3127750ecf81efb79c87884114d9209c0ae2475f5f7be78')
sha256sums_aarch64=('9a7e7ffb9b6e9bf9607b94f3082c12c946ce4132338c94fa7df7a212b7d5539b'
                    '318489f457dbc229206d14d47aca4d99f52f59a3499345575011b481985158e1')


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
