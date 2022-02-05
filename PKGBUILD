# Maintainer: solopasha <daron439 at gmail dot com>
pkgname=remnote
pkgver=1.5.3
pkgrel=1
pkgdesc="All-in-one workspace for note-taking, learning, organizing thoughts and growing knowledge"
arch=('x86_64')
url="https://www.remnote.com"
license=('custom:Commercial')
depends=('electron')
options=(!strip)
_appimage="RemNote-${pkgver}.AppImage"
source=("https://download.remnote.io/${_appimage}"
	"${pkgname}.sh")
noextract=("${_appimage}")
sha256sums=('85557ce634599a87ee7270cc845d12fe947b57dad88d981540b007c889985082'
            '3beaa112d4a90bd3c3f309121c52eb1f139354bcbff9a9cf378f693f53c0ef0a')
prepare() {
	cd "$srcdir"
	chmod a+x $_appimage
	./$_appimage --appimage-extract
	sed -i -e "s|^Exec=.*|Exec=/usr/bin/$pkgname %U|" \
		-e '/^X-AppImage-Version=.*/d' \
		-e '/Categories=/s/=/&Office;/' squashfs-root/${pkgname}.desktop
}

package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	install -Dm644 "${srcdir}/squashfs-root/remnote.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
