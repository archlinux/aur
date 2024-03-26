# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="osaka-simulator"
pkgdesc="A fanmade interactive Osaka simulator from hirahira.net for PC"

pkgver=Aug_2003
pkgrel=2

arch=(any)

url="https://azumanga.fandom.com/wiki/Ayumu_Kasuga%27s_Mail_Order_Life"
license=("LicenseRef-unknown")

depends=(wine winetricks)
makedepends=(unzip gendesk icoutils)

provides=(osaka-simulator)

source=("file://Osaka Simulator FINAL (standalone).zip" "osaka-simulator" "tsu_han.cfg")
md5sums=("69c5e729bd4acc28320afbcc863b454a" "8af04a78b75b73656908f722d6cbce19" "7b644ee8fdf4d1b8213115bef3a1b90c")

DLAGENTS=("file::/usr/bin/echo Could not find %u. Please download it to `$(pwd)` in order to build the package.")

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
	cp -r "Osaka Simulator FINAL"/* "${pkgdir}/opt/osaka-simulator"

	# delete the bundled-in save file and configuration file
	rm -f "${pkgdir}/opt/osaka-simulator/tsu_han.dat"
	rm -f "${pkgdir}/opt/osaka-simulator/tsu_han.cfg"

	# copy the package's configuration file
	install -Dm644 tsu_han.cfg "${pkgdir}/opt/osaka-simulator/tsu_han.cfg"

	# set the ownership of the game's directory to root:games
	chown -R root:games "${pkgdir}/opt/osaka-simulator"

	# copy the executable script
	install -Dm755 osaka-simulator "${pkgdir}/usr/bin/osaka-simulator"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 OsakaSimulator.png "${pkgdir}/usr/share/pixmaps/OsakaSimulator.png"
	install -Dm644 "Ayumu Kasuga's Mail Order Life.desktop" "${pkgdir}/usr/share/applications/OsakaSimulator.desktop"
}