# Maintainer: kyndair <kyndair at gmail dot com>

pkgname=tome4-bin
_pkgname=tome4
pkgver='1.7.5'
pkgrel='1'
pkgdesc="An open-source, single-player, role-playing roguelike game set in the world of Eyal."
arch=('i686' 'x86_64')
url="https://te4.org/"
license=('custom' 'GPL3')
provides=('tome4' "tome4=${pkgver}")
conflicts=('tome4')
source=(tome4 tome4.desktop)
source_x86_64=("https://te4.org/dl/t-engine/t-engine4-linux64-${pkgver}.tar.bz2")
source_i686=("https://te4.org/dl/t-engine/t-engine4-linux32-${pkgver}.tar.bz2")
sha256sums=('3a1e4901337f91697bcfaf095f488c447c27ccc2484a543e31f024d5aefb61a0'
            '80e663d9eb2d41c6d9c0a6b4b5b52eb33b0872c3412a617530777fd137c0baa1')
sha256sums_x86_64=('1ec45772765e37c443ed12107170e02f6cdc1f7df45c1551fefed3cfefa7f012')
sha256sums_i686=('57eb2fc0bf3d2103db42e608570abbf540cbb0b4bb516e9358f8d4fbd7a9b6d9')

package() {

	case "${CARCH}" in
		"i686")  _arch='32' _lib='lib' ;;
		"x86_64") _arch='64' _lib='lib64' ;;
	esac

	# Extract and install the icon.
	unzip -oj -qq "${srcdir}/t-engine4-linux${_arch}-${pkgver}/game/engines/te4-${pkgver}.teae" \
		"data/gfx/te4-icon.png" -d "${srcdir}"
	install -Dm644 "${srcdir}/te4-icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

	# Install the documents & licenses.
	install -Dm644 "${srcdir}/t-engine4-linux${_arch}-${pkgver}/CONTRIBUTING" "${pkgdir}/usr/share/doc/${_pkgname}/CONTRIBUTING"
	install -Dm644 "${srcdir}/t-engine4-linux${_arch}-${pkgver}/CREDITS" "${pkgdir}/usr/share/doc/${_pkgname}/CREDITS"
	install -Dm644 "${srcdir}/t-engine4-linux${_arch}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
	install -Dm644 "${srcdir}/t-engine4-linux${_arch}-${pkgver}/COPYING-MEDIA" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING-MEDIA"

	# set the correct permissions and move the game data into pkg
	find "${srcdir}/t-engine4-linux${_arch}-${pkgver}/" -type d -exec chmod 755 {} +
	find "${srcdir}/t-engine4-linux${_arch}-${pkgver}/" -type f -exec chmod 644 {} +
	mkdir -m755 -p "${pkgdir}/opt/${_pkgname}/"
	mv "${srcdir}/t-engine4-linux${_arch}-${pkgver}/bootstrap" "${pkgdir}/opt/${_pkgname}/"
	mv "${srcdir}/t-engine4-linux${_arch}-${pkgver}/game" "${pkgdir}/opt/${_pkgname}/"
	mv "${srcdir}/t-engine4-linux${_arch}-${pkgver}/launcher-${_lib}" "${pkgdir}/opt/${_pkgname}/"
	mv "${srcdir}/t-engine4-linux${_arch}-${pkgver}/${_lib}" "${pkgdir}/opt/${_pkgname}/"

	# Install the executable, and the launcher.
	install -Dm755 "${srcdir}/t-engine4-linux${_arch}-${pkgver}/cef3spawn${_arch}" "${pkgdir}/opt/${_pkgname}/cef3spawn${_arch}"
	install -Dm755 "${srcdir}/t-engine4-linux${_arch}-${pkgver}/t-engine" "${pkgdir}/opt/${_pkgname}/t-engine"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

}
