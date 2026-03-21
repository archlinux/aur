# Maintainer: bemxio <bemxiov at protonmail dot com>

_pkgname="mupen64-rr-lua"
pkgname="${_pkgname}-bin"

pkgdesc="Advanced N64 TASing emulator"

pkgver=1.3.0_20
pkgrel=1

arch=(any)

url="https://mupen64.com"
license=(GPL-2.0-or-later)

depends=(wine)
makedepends=(gendesk icoutils)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
	"Mupen64-Repack-${pkgver}.zip::https://github.com/mupen64/repack/archive/refs/heads/main.zip"
	"https://raw.githubusercontent.com/mupen64/mupen64-rr-lua/7826e9c6eda1abb24339a2b3d226edb1b670aaef/view/icons/mupen64.ico"
	"${_pkgname}"
)
md5sums=("b211cc9e65c3e2967218b890d22873b1" "a22a06af7e7b9a325b18445f0154d74a" "ea1bda425ee12ac95fa777736b0cdae7")

install="${_pkgname}.install"

prepare() {
	# extract the icon out of the ICO file
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
	# move into the source directory
	cd repack-main

	# copy all files to the package directory
	find . -type d -exec install -Dm755 -d "${pkgdir}/usr/share/${_pkgname}/{}" \;
	find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/${_pkgname}/{}" \;

	# set permissions for plugin directory
	chown root:games "${pkgdir}/usr/share/${_pkgname}/plugin"
	chmod 775 "${pkgdir}/usr/share/${_pkgname}/plugin"

	# copy the executable script
	install -Dm755 ../mupen64-rr-lua "${pkgdir}/usr/bin/${_pkgname}"

	# copy the icon and the .desktop file
	install -Dm644 ../icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 ../Mupen64-rr-lua.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}