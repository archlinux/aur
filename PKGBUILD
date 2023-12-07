# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname="osaka-simulator"
pkgdesc="A fanmade interactive Osaka simulator from hirahira.net for PC"

pkgver=Aug_2003
pkgrel=1

arch=(i686 x86_64)

url="https://azumanga.fandom.com/wiki/Ayumu_Kasuga%27s_Mail_Order_Life"
license=("unknown")

depends=(wine winetricks)
makedepends=(unzip gendesk icoutils)

provides=(osaka-simulator)

source=("local://Osaka Simulator FINAL (standalone).zip" "osaka-simulator" "tsu_han.cfg")
md5sums=("69c5e729bd4acc28320afbcc863b454a" "8af04a78b75b73656908f722d6cbce19" "7b644ee8fdf4d1b8213115bef3a1b90c")

prepare() {
	# extract the icon out of the executable
	wrestool -x -n 128 "Osaka Simulator FINAL/tsu_han.exe" -o OsakaSimulator.ico

	# get the highest quality PNG from the icon file
	icotool -x OsakaSimulator.ico -i 3 -o OsakaSimulator.png

	# generate a .desktop file
	gendesk -f -n \
		--pkgname "Ayumu Kasuga's Mail Order Life" \
		--pkgdesc "${pkgdesc}" \
		--exec osaka-simulator \
		--icon OsakaSimulator.png \
		--categories "Game;Simulation"
}

package() {
	# make the required directory
	mkdir -p "${pkgdir}/opt/osaka-simulator"

	# copy the game's files
	cp -r "${srcdir}/Osaka Simulator FINAL"/* "${pkgdir}/opt/osaka-simulator"

	# delete the bundled-in save file and configuration file
	rm -f "${pkgdir}/opt/osaka-simulator/tsu_han.dat"
	rm -f "${pkgdir}/opt/osaka-simulator/tsu_han.cfg"

	# copy the package's configuration file
	install -Dm644 "${srcdir}/tsu_han.cfg" "${pkgdir}/opt/osaka-simulator/tsu_han.cfg"

	# set the ownership of the game's directory to root:games
	chown -R root:games "${pkgdir}/opt/osaka-simulator"

	# copy the executable script
	install -Dm755 "${srcdir}/osaka-simulator" "${pkgdir}/usr/bin/osaka-simulator"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 OsakaSimulator.png "${pkgdir}/usr/share/pixmaps/OsakaSimulator.png"
	install -Dm644 "Ayumu Kasuga's Mail Order Life.desktop" "${pkgdir}/usr/share/applications/OsakaSimulator.desktop"
}