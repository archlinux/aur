# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname="resource-hacker"
pkgdesc="A resource editor for 32/64-bit Windows applications"

pkgver=5.2.7
pkgrel=1

arch=(i686 x86_64)

url="http://www.angusj.com/resourcehacker"
license=("freeware")

depends=(wine)
makedepends=(unzip gendesk icoutils)

provides=(resource-hacker)

source=("http://www.angusj.com/resourcehacker/resource_hacker.zip" "resource-hacker" "LICENSE")
md5sums=("b1f79f26558459d1b401ba9ece2e8d66" "d22c27bfeda3b660598ab6c918728d55" "f686b88c5279285dfa50e4e5a54a538c")

prepare() {
	# extract the icon out of the executable
	wrestool -x -n MAINICON ResourceHacker.exe -o ResourceHacker.ico

	# get the highest quality PNG from the icon file
	icotool -x ResourceHacker.ico -i 1 -o ResourceHacker.png

	# generate a .desktop file
	gendesk -f -n \
		--pkgname "Resource Hacker" \
		--pkgdesc "${pkgdesc}" \
		--exec resource-hacker \
		--icon ResourceHacker.png \
		--categories "Development;Utility"
}

package() {
	# make a directory for the Resource Hacker help & samples
	mkdir -p "${pkgdir}/usr/share/resource-hacker/help" "${pkgdir}/usr/share/resource-hacker/samples"

	# copy all of Resource Hacker's files
	install -Dm755 ResourceHacker.exe "${pkgdir}/usr/share/resource-hacker/ResourceHacker.exe"

	install -Dm644 ReadMe.txt "${pkgdir}/usr/share/resource-hacker/ReadMe.txt"
	install -Dm644 changes.txt "${pkgdir}/usr/share/resource-hacker/changes.txt"

	install -Dm644 help/* "${pkgdir}/usr/share/resource-hacker/help"
	install -Dm644 samples/* "${pkgdir}/usr/share/resource-hacker/samples"

	## copy the executable script
	install -Dm755 resource-hacker "${pkgdir}/usr/bin/resource-hacker"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 ResourceHacker.png "${pkgdir}/usr/share/pixmaps/ResourceHacker.png"
	install -Dm644 "Resource Hacker.desktop" "${pkgdir}/usr/share/applications/ResourceHacker.desktop"

	# copy the license file
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
