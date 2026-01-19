# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="anituner"
pkgdesc="Free software to create, edit and convert Windows animated cursors"

pkgver=2.0.0
pkgrel=11

arch=(any)

url="https://www.gdgsoft.com/anituner"
license=("LicenseRef-AniTuner")

depends=(wine)
makedepends=(gendesk icoutils)

source=("${pkgname}-${pkgver}.zip::https://download.gdgsoft.com/anitun2p.zip" "${pkgname}" "${pkgname}-atd.xml" "LICENSE.${pkgname}")
md5sums=("f0cff36790da5e3f9b02a65aa4d64101" "6acbdc9d1422f6d4464c6a8ab5119446" "2c084aaadfb308a757c12ca19c012f9f" "2c89a8cdf5a8ef238b07897d28c419a1")

prepare() {
	# extract icon out of executable
	wrestool -x -n MAINICON AniTuner.exe -o "${pkgname}.ico"

	# get highest quality PNG from icon file
	icotool -x "${pkgname}.ico" -i 6 --output "${pkgname}.png"

	# generate a .desktop file
	gendesk -f -n \
		--pkgname AniTuner \
		--pkgdesc "${pkgdesc}" \
		--exec "${pkgname}" \
		--icon "${pkgname}.png" \
		--categories "Graphics;Utility" \
		--mimetypes "image/bmp;image/jpeg;image/png;image/gif;image/vnd.adobe.photoshop;image/x-icon;image/x-win-bitmap;application/x-navi-animation;application/anituner-atd"
}

package() {
	# copy program files
	install -Dm755 AniTuner.exe "${pkgdir}/usr/share/${pkgname}/AniTuner.exe"
	install -Dm644 AniTunerPref.xml "${pkgdir}/usr/share/${pkgname}/AniTunerPref.xml"

	install -Dm644 AniTuner.chm "${pkgdir}/usr/share/${pkgname}/AniTuner.chm"
	install -Dm644 Readme.txt "${pkgdir}/usr/share/doc/${pkgname}/Readme.txt"

	find Samples -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/${pkgname}/{}" \;

	# copy executable script
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# copy extracted icon and generated .desktop file
	install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 AniTuner.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# copy custom MIME type
	install -Dm644 "${pkgname}-atd.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}-atd.xml"

	# copy license file
	install -Dm644 "LICENSE.${pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}