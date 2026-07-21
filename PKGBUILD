# Maintainer: bemxio <bemxiov at protonmail dot com>

_pkgname="mupen64-rr-lua"
pkgname="${_pkgname}-bin"

pkgdesc="Advanced N64 TASing emulator"

pkgver=1.4.0_7
pkgrel=1

arch=(any)

url="https://mupen64.com"
license=(GPL-2.0-or-later)

depends=(wine)
makedepends=(gendesk icoutils)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
	"Mupen64-Repack-${pkgver}.zip::https://github.com/mupen64/repack-stable/archive/f910b4cb1ed4a4c84cb4dbf76ef01db63ac5cc8f.zip"
	"https://raw.githubusercontent.com/mupen64/mupen64-rr-lua/7826e9c6eda1abb24339a2b3d226edb1b670aaef/view/icons/mupen64.ico"
	"${_pkgname}"
)
md5sums=(8a38d7da0d69dfe5ba93f4063c16c88e a22a06af7e7b9a325b18445f0154d74a b9b89818f43ee4963f3a4f8a0ff12eec)

install="${_pkgname}.install"

prepare() {
	# extract icon out of ICO file
	icotool -x -i 4 mupen64.ico -o icon.png

	# generate a .desktop file
	gendesk -f -n \
		--pkgname Mupen64-rr-lua \
		--pkgdesc "${pkgdesc}" \
		--exec "${_pkgname}" \
		--icon "${_pkgname}.png" \
		--categories "Game;Emulator"
}

package() {
	# move into source directory
	cd repack-*/stable

	# copy all files to package directory
	find . -type d -exec install -Dm755 -d "${pkgdir}/usr/share/${_pkgname}/{}" \;
	find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/${_pkgname}/{}" \;

	# set permissions for plugins directory
	chown root:games "${pkgdir}/usr/share/${_pkgname}/plugin"
	chmod 775 "${pkgdir}/usr/share/${_pkgname}/plugin"

	# copy executable script
	install -Dm755 ../../"${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# copy icon and .desktop file
	install -Dm644 ../../icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 ../../Mupen64-rr-lua.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}