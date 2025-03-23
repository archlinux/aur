# Maintainer: honjow
pkgname=moonlight-qt-axi-appimage
_pkgname=moonlight-qt-bin
pkgver=6.1.0
pkgrel=1
pkgdesc="moonlight-qt by Axixi2233 bin from appimage"
arch=('x86_64')
url="https://github.com/Axixi2233/moonlight-qt"
license=('GPL3-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'ffmpeg' 'sdl2_ttf')
optdepends=(
	'libva-intel-driver: hardware-acelerated decoding for Intel'
	'libva-mesa-driver: hardware-acelerated decoding for AMD/others'
	'libva-nvidia-driver: hardware-acelerated decoding for NVIDIA with NVDEC via VA-API'
)
source=("${_pkgname%-bin}-$pkgver.AppImage::https://github.com/Axixi2233/moonlight-qt/releases/download/250306/Moonlight-6.1.0-x86_64-ax-0319.AppImage"
	"launcher.sh")

provides=("${_pkgname%-bin}" "moonlight")
conflicts=("${_pkgname%-bin}" "moonlight")
replaces=("${_pkgname%-bin}" "moonlight")
sha256sums=('75c1fc3e9a2f1c74d9e8f0c68db5c93b173edc1f918e5eba5bb95fe00b4b5cdc'
            '7dc324b4621067c01c1ea91570dec230fb43735f48f5f9eac91b0e487070a79d')
options=(!strip)
prepare() {
	# extract appimage
	chmod +x "${_pkgname%-bin}-$pkgver.AppImage"
	./"${_pkgname%-bin}-$pkgver.AppImage" --appimage-extract 1>/dev/null

	# Rename file
	mv "squashfs-root/com.moonlight_stream.Moonlight.desktop" "squashfs-root/${_pkgname%-bin}.desktop"

	# Remove X-AppImage-Version
	sed -i '/AppImage/d' "squashfs-root/${_pkgname%-bin}.desktop"
}

package() {
	mkdir "${pkgdir}/opt/" -p
	cp -r squashfs-root "${pkgdir}/opt/${_pkgname}"
	mkdir "${pkgdir}/usr/bin/" -p
	install -dm644 "${pkgdir}/opt/"
	install -m755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/moonlight"
	install -m755 "squashfs-root/AppRun" "${pkgdir}/opt/${_pkgname}/AppRun"

	install -Dm644 "squashfs-root/${_pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications/"

	install -d "$pkgdir/usr/share/icons/"
	cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}