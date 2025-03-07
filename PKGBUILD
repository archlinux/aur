# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="osaka-simulator"
pkgdesc="A fanmade interactive Osaka simulator from hirahira.net for PC"

pkgver=Aug_2003
pkgrel=8

arch=(any)

url="http://web.archive.org/web/20230207145313/http://www.hirahira.net/products/tsu_hanFinal/index.html"
license=("LicenseRef-OsakaSimulator")

depends=(wine winetricks)
makedepends=(gendesk icoutils)

source=("file://Osaka Simulator FINAL (standalone).zip" "LICENSE.osakasimulator" "osaka-simulator" "tsu_han.cfg")
md5sums=("69c5e729bd4acc28320afbcc863b454a" "8dbaaafc4d661ff2eed17a2e3d32ca77" "8af04a78b75b73656908f722d6cbce19" "7b644ee8fdf4d1b8213115bef3a1b90c")

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
		--icon osaka-simulator.png \
		--categories "Game;Simulation"
}

package() {
	# move to the source directory
	cd "Osaka Simulator FINAL"

	# delete the bundled-in save file and configuration file
	rm -f tsu_han.dat
	rm -f tsu_han.cfg

	# copy the game's files
	find . -type d -exec install -Dm755 -ggames -d "${pkgdir}/opt/osaka-simulator/{}" \;
	find . -type f \
		-not -name "tsu_han.exe" \
		-exec install -Dm644 -ggames {} "${pkgdir}/opt/osaka-simulator/{}" \;

	install -Dm755 tsu_han.exe "${pkgdir}/opt/osaka-simulator/tsu_han.exe"

	# copy the package's configuration file
	install -Dm644 ../tsu_han.cfg "${pkgdir}/opt/osaka-simulator/tsu_han.cfg"

	# copy the executable script
	install -Dm755 ../osaka-simulator "${pkgdir}/usr/bin/osaka-simulator"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 ../OsakaSimulator.png "${pkgdir}/usr/share/pixmaps/osaka-simulator.png"
	install -Dm644 ../"Ayumu Kasuga's Mail Order Life.desktop" "${pkgdir}/usr/share/applications/osaka-simulator.desktop"

	# copy the license
	install -Dm644 ../LICENSE.osakasimulator "${pkgdir}/usr/share/licenses/osaka-simulator/LICENSE"
}