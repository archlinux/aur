# Maintainers: XenHat <me at xenh.at>, luni3359
pkgname=moonlight-qt-bin
pkgver=6.1.0
pkgrel=2
pkgdesc="moonlight-qt bin from appimage"
arch=('x86_64')
url="https://moonlight-stream.org"
license=('GPL3-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'ffmpeg' 'sdl2_ttf')
optdepends=(
	'libva-intel-driver: hardware-acelerated decoding for Intel'
	'libva-mesa-driver: hardware-acelerated decoding for AMD/others'
	'libva-nvidia-driver: hardware-acelerated decoding for NVIDIA with NVDEC via VA-API'
)
source=("${pkgname%-bin}-$pkgver.AppImage::https://github.com/moonlight-stream/moonlight-qt/releases/download/v${pkgver}/Moonlight-${pkgver}-x86_64.AppImage"
	"launcher.sh")
_bin_name="${pkgname%-qt-bin}"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha256sums=('0e855ffd22d407e18ab5fdb575fed5f01ca119a3f91993c5f0213f15ac80b400'
            '7dc324b4621067c01c1ea91570dec230fb43735f48f5f9eac91b0e487070a79d')
options=(!strip)
prepare() {
	# extract appimage
	chmod +x "${pkgname%-bin}-$pkgver.AppImage"
	./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract 1>/dev/null

	# Rename file
	mv "squashfs-root/com.moonlight_stream.Moonlight.desktop" "squashfs-root/${pkgname%-bin}.desktop"

	# Remove X-AppImage-Version
	sed -i '/AppImage/d' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
	# install -Dm755 "squashfs-root/usr/bin/${_bin_name}" -t "$pkgdir/usr/bin/"
	mkdir "${pkgdir}/opt/" -p
	cp -r squashfs-root "${pkgdir}/opt/${pkgname}"
	mkdir "${pkgdir}/usr/bin/" -p
	install -dm644 "${pkgdir}/opt/"
	install -m755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/moonlight"
	install -m755 "squashfs-root/AppRun" "${pkgdir}/opt/${pkgname}/AppRun"

	install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications/"
	# install -m644 "squashfs-root/usr"
	install -d "$pkgdir/usr/share/icons/"
	cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}
