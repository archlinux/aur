# Maintainer: Marius Hirt <marius-hirt@web.de>
_pkgname=dezor
pkgname=dezor-appimage
pkgver=0.35.3
pkgrel=1
pkgdesc="The web browser including VPN & Adblocker"
arch=('x86_64')
url='https://dezor.net'
license=('unknown')
options=('!strip')
source=(
	"$_pkgname-$pkgver.AppImage::https://cdn.dezor.net/updates/linux/Dezor-v$pkgver-x86_64.AppImage"
)
sha256sums=(
	'5ef0d7c4a621a899a060503c0792fe812328da2c8e2c1d0947ee6ac24f0d90a6'
)

prepare() {
	# extract from AppImage
	chmod +x "${srcdir}/$_pkgname-$pkgver.AppImage"
	"${srcdir}/$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/icons/hicolor/*/apps/$_pkgname.png" > /dev/null
	"${srcdir}/$_pkgname-$pkgver.AppImage" --appimage-extract "$_pkgname.desktop" > /dev/null

	# patch .desktop file
	sed -i -E "s|Exec=AppRun|Exec=/opt/appimages/dezor.AppImage|" "${srcdir}/squashfs-root/$_pkgname.desktop"
}

package() {
	pushd "${srcdir}/squashfs-root"
	find "usr/share/icons" -type f -exec install -Dm 644 "{}" "${pkgdir}/{}" \; > /dev/null
	popd

	install -Dm 644 "${srcdir}/squashfs-root/$_pkgname.desktop" "${pkgdir}/usr/share/applications/$_pkgname.desktop"
	install -Dm 755 "${srcdir}/$_pkgname-$pkgver.AppImage" "${pkgdir}/opt/appimages/$_pkgname.AppImage"

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/opt/appimages/$_pkgname.AppImage" "${pkgdir}/usr/bin/$_pkgname"
}
