# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="mupen64-rr-lua-bin"
pkgdesc="N64 TASing emulator with Lua scripting support"

pkgver=1.2.0
pkgrel=1

arch=(any)

url="https://github.com/mupen64/mupen64-rr-lua"
license=("GPL-2.0-or-later")

depends=(wine)
makedepends=(gendesk icoutils)

provides=(mupen64-rr-lua)

source=(
	"Mupen64-RR_Repack28.7z::https://repack.skazzy3.com"
	"https://raw.githubusercontent.com/mupen64/mupen64-rr-lua/7826e9c6eda1abb24339a2b3d226edb1b670aaef/view/icons/mupen64.ico"
	"mupen64-rr-lua"
)
md5sums=("f56282e72e2920bbd2ed3cbfdb557d3f" "a22a06af7e7b9a325b18445f0154d74a" "111c2c96d40dce69cdf3b50e644f4136")

prepare() {
	# extract the icon out of the .ico file
	icotool -x -i 4 mupen64.ico -o logo.png

	# generate a .desktop file
	gendesk -f -n \
		--pkgname Mupen64-rr-lua \
		--pkgdesc "${pkgdesc}" \
		--exec mupen64-rr-lua \
		--icon mupen64-rr-lua.png \
		--categories "Game;Emulator"
}

package() {
	# move into the source directory
	cd "Mupen64-RR Repack"

	# copy all files to the package directory
	find . -type d -exec install -Dm775 -ggames -d "${pkgdir}/opt/mupen64-rr-lua/{}" \;
	find . -type f -exec install -Dm664 -ggames "{}" "${pkgdir}/opt/mupen64-rr-lua/{}" \;

	# copy the executable script
	install -Dm755 ../mupen64-rr-lua "${pkgdir}/usr/bin/mupen64-rr-lua"

	# copy the icon and the .desktop file
	install -Dm644 ../logo.png "${pkgdir}/usr/share/pixmaps/mupen64-rr-lua.png"
	install -Dm644 ../Mupen64-rr-lua.desktop "${pkgdir}/usr/share/applications/mupen64-rr-lua.desktop"
}