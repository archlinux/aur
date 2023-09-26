# Contributor: solopasha <daron439 at gmail dot com>
# Maintainer: asuka minato

pkgname=remnote
pkgver=1.12.38
pkgrel=1
pkgdesc="All-in-one workspace for note-taking, learning, organizing thoughts and growing knowledge"
arch=('x86_64' 'aarch64')
depends=(bash electron21)
url="https://www.remnote.com"
license=('custom:Commercial')
_appimage="RemNote-${pkgver}.AppImage"
source=("https://download.remnote.io/remnote-desktop/RemNote-$pkgver.AppImage"
	remnote.sh)
sha256sums=('0da0034b70961fa49c22841e1288e90cf520dfbda5d3ac27fa4aab5acc54a0c3'
            'c6bd5671157a94676ca8ca47163e329b645bc5a679e8b1e90f3cdbddb4ad869e')

prepare() {
	chmod a+x $_appimage
	./$_appimage --appimage-extract
	sed -i -e "s|^Exec=.*|Exec=/usr/bin/$pkgname %U|" \
		-e '/^X-AppImage-Version=.*/d' \
		-e '/Categories=/s/=/&Office;/' squashfs-root/${pkgname}.desktop
}

package() {
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -av "squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
	printf "remove c/cpp file\n"
	find $pkgdir/usr/lib/$pkgname \( -name "*.c" -or -name "*.h" -or -name "*.mk" -or -name "*.Makefile" -or -name "*.cpp" -or -name "*.hpp" \) -print -delete
	chmod -R 755 "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked"
	install -Dm644 "squashfs-root/remnote.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "squashfs-root/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
