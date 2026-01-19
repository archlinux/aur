# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="resource-hacker"
pkgdesc="A freeware resource compiler & decompiler for Windows applications"

pkgver=5.2.8
pkgrel=3

arch=(any)

url="https://www.angusj.com/resourcehacker"
license=("LicenseRef-ResourceHacker")

depends=(wine)
makedepends=(gendesk icoutils)

source=("${pkgname}-${pkgver}.zip::https://www.angusj.com/resourcehacker/resource_hacker.zip" "resource-hacker" "LICENSE.resource-hacker")
md5sums=("5049d2d44a5b378c6dd92524b902c4e7" "01748cf604897644bb6bdb410cffba19" "74ac74cfc24b7b4561f3be670c63da24")

prepare() {
	# extract icon out of executable
	wrestool -x -n MAINICON ResourceHacker.exe -o ResourceHacker.ico

	# get highest quality PNG from icon file
	icotool -x ResourceHacker.ico -i 1 -o ResourceHacker.png

	# generate .desktop file
	gendesk -f -n \
		--pkgname "Resource Hacker" \
		--pkgdesc "${pkgdesc}" \
		--exec resource-hacker \
		--icon resource-hacker \
		--categories "Development;Utility"
}

package() {
	# copy all program files
	install -Dm755 ResourceHacker.exe "${pkgdir}/usr/share/${pkgname}/ResourceHacker.exe"

	install -Dm644 ReadMe.txt "${pkgdir}/usr/share/doc/${pkgname}/ReadMe.txt"
	install -Dm644 changes.txt "${pkgdir}/usr/share/doc/${pkgname}/changes.txt"

	find help -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;
	find samples -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;

	# copy executable script
	install -Dm755 resource-hacker "${pkgdir}/usr/bin/${pkgname}"

	# copy extracted icon and generated .desktop file
	install -Dm644 ResourceHacker.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "Resource Hacker.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# copy license file
	install -Dm644 LICENSE.resource-hacker "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
