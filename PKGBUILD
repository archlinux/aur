# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="osaka-simulator"
pkgdesc="A fanmade interactive Osaka simulator from hirahira.net for PC"

pkgver=Aug_2003
pkgrel=9

arch=(any)

url="http://web.archive.org/web/20230207145313/http://www.hirahira.net/products/tsu_hanFinal/index.html"
license=("LicenseRef-OsakaSimulator")

depends=(wine winetricks)
makedepends=(gendesk icoutils)

source=("file://Osaka Simulator FINAL (standalone).zip" "${pkgname}" tsu_han.cfg "LICENSE.${pkgname}")
md5sums=("69c5e729bd4acc28320afbcc863b454a" "0d89ef4c37848f5d3ee2a0daeb114856" "7b644ee8fdf4d1b8213115bef3a1b90c" "8dbaaafc4d661ff2eed17a2e3d32ca77")

DLAGENTS=("file::/usr/bin/echo Could not find %u. Please copy it to $(pwd) in order to build package.")

prepare() {
	# extract icon out of executable
	wrestool -x -n 128 "Osaka Simulator FINAL/tsu_han.exe" -o "${pkgname}.ico"

	# get highest quality PNG from icon file
	icotool -x "${pkgname}.ico" -i 3 -o "${pkgname}.png"

	# generate a .desktop file
	gendesk -f -n \
		--pkgname "Ayumu Kasuga's Mail Order Life" \
		--pkgdesc "${pkgdesc}" \
		--exec "${pkgname}" \
		--icon "${pkgname}.png" \
		--categories "Game;Simulation"
}

package() {
	# move to source directory
	cd "Osaka Simulator FINAL"

	# delete leftover save, config and log files
	rm tsu_han.dat tsu_han.cfg init.log

	# copy osaka simulator files
	find . -type f \
		-not -name tsu_han.exe \
		-exec install -Dm644 "{}" "${pkgdir}/usr/share/${pkgname}/{}" \;

	install -Dm755 tsu_han.exe "${pkgdir}/usr/share/${pkgname}/tsu_han.exe"

	# copy package's configuration file
	install -Dm644 ../tsu_han.cfg "${pkgdir}/usr/share/${pkgname}/tsu_han.cfg"

	# copy executable script
	install -Dm755 ../"${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# copy extracted icon and generated .desktop file
	install -Dm644 ../"${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 ../"Ayumu Kasuga's Mail Order Life.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# copy license
	install -Dm644 ../"LICENSE.${pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}