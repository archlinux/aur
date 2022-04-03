# Maintainer: solopasha <daron439 at gmail dot com>
pkgname=remnote
pkgver=1.7.6
pkgrel=2
pkgdesc="All-in-one workspace for note-taking, learning, organizing thoughts and growing knowledge"
arch=('x86_64')
url="https://www.remnote.com"
license=('custom:Commercial')
depends=('electron17')
options=(!strip)
_appimage="RemNote-${pkgver}.AppImage"
source=("https://download.remnote.io/${_appimage}"
	"${pkgname}.sh")
noextract=("${_appimage}")
sha256sums=('c915292debff16bde639a9a41607af02bbf65285e05787bace5cafec5690e113'
            '0563c942b12e1e174ef2a7732f62809b84b709078d814449432b6ee76706b907')
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
