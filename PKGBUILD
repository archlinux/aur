# Maintainer: kyndair <kyndair at gmail dot com>

pkgname=tome4-bin
_pkgname=tome4
pkgver='1.7.4'
pkgrel='1'
pkgdesc="An open-source, single-player, role-playing roguelike game set in the world of Eyal."
arch=('i686' 'x86_64')
url="http://tome.te4.org/"
license=('custom' 'GPL3')
conflicts=('tome4' 'tome4-git')
provides=('tome4')
source=(tome4 tome4.desktop)
source_x86_64=("https://te4.org/dl/t-engine/t-engine4-linux64-${pkgver}.tar.bz2")
source_i686=("https://te4.org/dl/t-engine/t-engine4-linux32-${pkgver}.tar.bz2")
sha256sums=('3a1e4901337f91697bcfaf095f488c447c27ccc2484a543e31f024d5aefb61a0'
            '80e663d9eb2d41c6d9c0a6b4b5b52eb33b0872c3412a617530777fd137c0baa1')
sha256sums_x86_64=('ab53ce825063318564ee2ff74833b86792ee4f276319f5dd57e3803c489defaa')
sha256sums_i686=('ee78900675d6119ee5e152a4fb9e3a8d26b966a5e6942996dcd8ceae45b6b193')

package() {

	case "${CARCH}" in
		"i686")  _pkg='32' _lib='lib' ;;
		"x86_64") _pkg='64' _lib='lib64' ;;
	esac

	# Extract and install the icon.
	unzip -oj -qq "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/game/engines/te4-${pkgver}.teae" \
		"data/gfx/te4-icon.png" -d "${srcdir}"
	install -Dm644 "${srcdir}/te4-icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	
	# Install the documents & licenses.
	install -Dm644 "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/CONTRIBUTING" "${pkgdir}/usr/share/doc/${_pkgname}/CONTRIBUTING"
	install -Dm644 "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/CREDITS" "${pkgdir}/usr/share/doc/${_pkgname}/CREDITS"
	install -Dm644 "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
	install -Dm644 "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/COPYING-MEDIA" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING-MEDIA"

	# set the correct permissions and move the game data into pkg
	find "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/" -type d -exec chmod 755 {} +
	find "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/" -type f -exec chmod 644 {} +
	mkdir -m755 -p "${pkgdir}/opt/${_pkgname}/"
	mv "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/bootstrap" "${pkgdir}/opt/${_pkgname}/"
	mv "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/game" "${pkgdir}/opt/${_pkgname}/"
	mv "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/launcher-${_lib}" "${pkgdir}/opt/${_pkgname}/"
	mv "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/${_lib}" "${pkgdir}/opt/${_pkgname}/"

	# Install the executable, and the launcher.
	install -Dm755 "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/cef3spawn${_pkg}" "${pkgdir}/opt/${_pkgname}/cef3spawn${_pkg}"
	install -Dm755 "${srcdir}/t-engine4-linux${_pkg}-${pkgver}/t-engine" "${pkgdir}/opt/${_pkgname}/t-engine"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

}
