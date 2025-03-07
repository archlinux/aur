# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="anituner"
pkgdesc="Create, edit and convert Windows animated cursors"

pkgver=2.0.0
pkgrel=10

arch=(any)

url="https://www.gdgsoft.com/anituner"
license=("LicenseRef-AniTuner")

depends=(wine)
makedepends=(gendesk icoutils)

source=("https://download.gdgsoft.com/anitun2p.zip" "anituner" "anituner-atd.xml" "LICENSE.anituner")
md5sums=("f0cff36790da5e3f9b02a65aa4d64101" "056298b9cb09a504b6b39fbb0213c199" "2c084aaadfb308a757c12ca19c012f9f" "2c89a8cdf5a8ef238b07897d28c419a1")

prepare() {
	# extract the icon out of the executable
	wrestool -x -n MAINICON AniTuner.exe -o AniTuner.ico

	# get the highest quality PNG from the icon file
	icotool -x AniTuner.ico -i 6 --output AniTuner.png

	# generate a .desktop file
	gendesk -f -n \
		--pkgname AniTuner \
		--pkgdesc "${pkgdesc}" \
		--exec anituner \
		--icon anituner.png \
		--categories "Graphics;Utility" \
		--mimetypes "image/bmp;image/jpeg;image/png;image/gif;image/vnd.adobe.photoshop;image/x-icon;image/x-win-bitmap;application/x-navi-animation;application/anituner-atd"
}

package() {
	# copy all of AniTuner's files
	install -Dm755 AniTuner.exe "${pkgdir}/usr/share/anituner/AniTuner.exe"
	install -Dm644 AniTunerPref.xml "${pkgdir}/usr/share/anituner/AniTunerPrefDefault.xml"

	install -Dm644 AniTuner.chm "${pkgdir}/usr/share/anituner/AniTuner.chm"
	install -Dm644 Readme.txt "${pkgdir}/usr/share/anituner/Readme.txt"

	find Samples -type f -exec install -Dm644 {} "${pkgdir}/usr/share/anituner/{}" \;

	# copy the executable script
	install -Dm755 anituner "${pkgdir}/usr/bin/anituner"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 AniTuner.png "${pkgdir}/usr/share/pixmaps/anituner.png"
	install -Dm644 AniTuner.desktop "${pkgdir}/usr/share/applications/anituner.desktop"

	# copy the custom MIME type
	install -Dm644 anituner-atd.xml "${pkgdir}/usr/share/mime/packages/anituner-atd.xml"

	# copy the license file
	install -Dm644 LICENSE.anituner "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}