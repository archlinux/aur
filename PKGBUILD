# Contributor: solopasha <daron439 at gmail dot com>
# Maintainer: asuka minato

pkgname=remnote
pkgver=1.11.3
pkgrel=1
pkgdesc="All-in-one workspace for note-taking, learning, organizing thoughts and growing knowledge"
arch=('x86_64')
depends=(
	glibc
	bash
	gcc-libs
)
url="https://www.remnote.com"
license=('custom:Commercial')
options=(!strip)
_appimage="RemNote-${pkgver}.AppImage"
source=("https://download.remnote.io/remnote-desktop/RemNote-$pkgver.AppImage"
	remnote.sh)
noextract=("${_appimage}")
sha256sums=('b04763106c1e9ab8437b3ba44f30b65141f9af9d7dc19c096ea8fae5a095c8af'
            'c6bd5671157a94676ca8ca47163e329b645bc5a679e8b1e90f3cdbddb4ad869e')

prepare() {
	chmod a+x $_appimage
	./$_appimage --appimage-extract
	sed -i -e "s|^Exec=.*|Exec=/usr/bin/$pkgname %U|" \
		-e '/^X-AppImage-Version=.*/d' \
		-e '/Categories=/s/=/&Office;/' squashfs-root/${pkgname}.desktop
}

package() {
	depends=('electron21')
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -av "squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
	chmod -R 755 "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked"
	install -Dm644 "squashfs-root/remnote.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "squashfs-root/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
