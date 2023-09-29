# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname="anituner"
pkgdesc="Create, edit and convert Windows animated cursors"

pkgver=2.0.0
pkgrel=5

arch=(i686 x86_64)

url="https://www.gdgsoft.com/anituner"
license=("freeware")

depends=(wine)
makedepends=(unzip gendesk icoutils)

provides=(anituner)

source=("https://download.gdgsoft.com/anitun2p.zip" "anituner" "anituner-atd.xml" "LICENSE")
md5sums=("f0cff36790da5e3f9b02a65aa4d64101" "be9cfcd1a8c5f57cfae60e6739e0fceb" "2c084aaadfb308a757c12ca19c012f9f" "337e55594ad95557e6659ae8e0a91164")

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
		--icon AniTuner.png \
		--categories "Graphics;Utility" \
		--mimetypes "image/bmp;image/jpeg;image/png;image/gif;image/vnd.adobe.photoshop;image/x-icon;image/x-win-bitmap;application/x-navi-animation;application/anituner-atd"
}

package() {
	# make a directory for the AniTuner samples
	mkdir -p "${pkgdir}/usr/share/anituner/Samples"

	# copy all of AniTuner's files
	install -Dm755 AniTuner.exe "${pkgdir}/usr/share/anituner"
	install -Dm644 AniTunerPref.xml "${pkgdir}/usr/share/anituner/AniTunerPrefDefault.xml"

	install -Dm644 AniTuner.chm "${pkgdir}/usr/share/anituner/AniTuner.chm"
	install -Dm644 Readme.txt "${pkgdir}/usr/share/anituner/Readme.txt"

	install -Dm644 Samples/* "${pkgdir}/usr/share/anituner/Samples"

	# copy the executable script
	install -Dm755 anituner "${pkgdir}/usr/bin/anituner"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 AniTuner.png "${pkgdir}/usr/share/pixmaps/AniTuner.png"
	install -Dm644 AniTuner.desktop "${pkgdir}/usr/share/applications/AniTuner.desktop"

	# copy the custom MIME type
	install -Dm644 anituner-atd.xml "${pkgdir}/usr/share/mime/packages/anituner-atd.xml"

	# copy the license file
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}