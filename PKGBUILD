# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname="anituner"
pkgdesc="Create, edit and convert Windows animated cursors"

pkgver=2.0.0
pkgrel=4

arch=(i686 x86_64)

url="https://www.gdgsoft.com/anituner"
license=("freeware")

depends=(wine)
makedepends=(unzip gendesk icoutils)

provides=(anituner)

source=("https://download.gdgsoft.com/anitun2p.zip")
md5sums=("f0cff36790da5e3f9b02a65aa4d64101")

prepare() {
	# make a temporary directory and move into it
	mkdir -p "${startdir}/tmp" && cd "${startdir}/tmp"

	# extract the icon out of the executable
	wrestool -x -n MAINICON "${srcdir}/AniTuner.exe" -o AniTuner.ico

	# get the highest quality PNG from the icon file
	icotool -x AniTuner.ico -i 6 --output AniTuner.png

	# generate a .desktop file
	gendesk -f -n \
		--pkgname AniTuner \
		--pkgdesc "${pkgdesc}" \
		--exec anituner \
		--icon AniTuner.png \
		--categories "Graphics;Utility" \
		--mimetypes "image/bmp;image/jpeg;image/png;image/gif;image/vnd.adobe.photoshop;image/x-icon;image/x-win-bitmap;application/x-navi-animation;application/anituner-atd"
}

package() {
	# rename the default configuration file
	mv "${srcdir}/AniTunerPref.xml" "${srcdir}/AniTunerPrefDefault.xml"

	# make the required directories
	mkdir -p "${pkgdir}/usr/share/anituner"
	mkdir -p "${pkgdir}/usr/share/anituner/Samples"

	mkdir -p "${pkgdir}/usr/bin"

	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/mime/packages"

	# copy all of AniTuner's files
	install -Dm755 "${srcdir}/AniTuner.exe" "${pkgdir}/usr/share/anituner"
	install -Dm644 "${srcdir}/AniTuner.chm" "${pkgdir}/usr/share/anituner"
	install -Dm644 "${srcdir}/AniTunerPrefDefault.xml" "${pkgdir}/usr/share/anituner"
	install -Dm644 "${srcdir}/Readme.txt" "${pkgdir}/usr/share/anituner"
	install -Dm644 "${srcdir}/Samples/"* "${pkgdir}/usr/share/anituner/Samples"

	# remove the symlink to the ZIP from the package files
	rm -f "${pkgdir}/usr/share/anituner/anitun2p.zip"

	# copy the executable script
	install -v -Dm755 "${startdir}/anituner" "${pkgdir}/usr/bin"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 "${startdir}/tmp/AniTuner.png" "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${startdir}/tmp/AniTuner.desktop" "${pkgdir}/usr/share/applications"

	# copy the custom MIME type
	install -Dm644 "${startdir}/anituner-atd.xml" "${pkgdir}/usr/share/mime/packages"
}
