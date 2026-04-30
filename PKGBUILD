# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=am
_pkgauthor=sassman
_pkgbase=amoxide
_pkgname=${_pkgbase}-rs
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgbase}-bin ${_pkgbase}-tui-bin)
pkgdesc="Like direnv, but for aliases. Define aliases per project, per toolchain, or globally — and load the right ones automatically."

pkgver=0.8.1
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
sha256sums=('fa9124dd31474c7cae3b54be696513f01d956644235c5c343856823cb767d738'
            '395dc28378eb9afaaac3afec5442f233d141808b64d34c09a160ba2bb29f8e96'
            '3012dd3b51b8175f6122b8eda386bf4275c679b4537e45689f90a5b7f44c066c')
sha256sums_x86_64=('270457a1554c53879697f5a6b2c0803e0210ee333b549d9c22f08b32cae996e1'
                   '476bdcb9a24b8a27c336514f86e59bc11ddfd6ee1f3c17be7e0e3f5dcd2af97f')
sha256sums_aarch64=('c0c236b680add497516a9cedc814bf565311ad8bc004a198c998cc0bac6b42bb'
                    '5e6d98695b4bf242d6c6cf0a55ba1e3eb71e159a6ab0f12b1b78690fb362e22b')


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
