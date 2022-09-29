# Maintainer: solopasha <daron439 at gmail dot com>
pkgname=remnote
pkgver=1.8.35
pkgrel=1
pkgdesc="All-in-one workspace for note-taking, learning, organizing thoughts and growing knowledge"
arch=('x86_64')
url="https://www.remnote.com"
license=('custom:Commercial')
options=(!strip)
_appimage="RemNote-${pkgver}.AppImage"
source=("https://download.remnote.io/${_appimage}"
	"${pkgname}.sh")
noextract=("${_appimage}")
sha256sums=('4da01d6369749f340a09637eb794c8d8dbbdba9132c44f1480193733d2ab758e'
            '25f625c75af753260ed530a759f7adb09fe8cc164ec2f566923a1d229e6a2485')
prepare() {
	chmod a+x $_appimage
	./$_appimage --appimage-extract
	sed -i -e "s|^Exec=.*|Exec=/usr/bin/$pkgname %U|" \
		-e '/^X-AppImage-Version=.*/d' \
		-e '/Categories=/s/=/&Office;/' squashfs-root/${pkgname}.desktop
}

package() {
	depends=('electron19')
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	install -Dm644 "${srcdir}/squashfs-root/remnote.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
