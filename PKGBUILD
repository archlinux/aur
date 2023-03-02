# Maintainer: Marius Hirt <marius-hirt@web.de>
_pkgname=dezor
pkgname=dezor-appimage
pkgver=1.1.1
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
	'0b28c4299c31a60525685961bbaebe2ad8cdd91d320bae111a19fb67ed49e723'
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
	pushd "${srcdir}/squashfs-root" > /dev/null
	find "usr/share/icons" -type f -exec install -Dm 644 "{}" "${pkgdir}/{}" \;
	popd > /dev/null

	install -Dm 644 "${srcdir}/squashfs-root/$_pkgname.desktop" "${pkgdir}/usr/share/applications/$_pkgname.desktop"
	install -Dm 755 "${srcdir}/$_pkgname-$pkgver.AppImage" "${pkgdir}/opt/appimages/$_pkgname.AppImage"

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/opt/appimages/$_pkgname.AppImage" "${pkgdir}/usr/bin/$_pkgname"
}
