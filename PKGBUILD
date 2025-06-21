# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="resource-hacker"
pkgdesc="A resource editor for 32/64-bit Windows applications"

pkgver=5.2.8
pkgrel=2

arch=(any)

url="http://www.angusj.com/resourcehacker"
license=("LicenseRef-ResourceHacker")

depends=(wine)
makedepends=(gendesk icoutils)

source=("${pkgname}-${pkgver}.zip::http://www.angusj.com/resourcehacker/resource_hacker.zip" "resource-hacker" "LICENSE.resourcehacker")
md5sums=("5049d2d44a5b378c6dd92524b902c4e7" "e0cee5d95899e83a2e1b1571bbb98be6" "f686b88c5279285dfa50e4e5a54a538c")

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
		--icon resource-hacker \
		--categories "Development;Utility"
}

package() {
	# copy all of Resource Hacker's files
	install -Dm755 ResourceHacker.exe "${pkgdir}/usr/share/${pkgname}/ResourceHacker.exe"

	install -Dm644 ReadMe.txt "${pkgdir}/usr/share/${pkgname}/ReadMe.txt"
	install -Dm644 changes.txt "${pkgdir}/usr/share/${pkgname}/changes.txt"

	find help -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;
	find samples -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;

	# copy the executable script
	install -Dm755 resource-hacker "${pkgdir}/usr/bin/${pkgname}"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 ResourceHacker.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "Resource Hacker.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# copy the license file
	install -Dm644 LICENSE.resourcehacker "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
