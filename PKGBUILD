# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Aron Young <tkf6fkt at gmail dot com>
# Maintainer: asuka minato

pkgname=remnote
pkgver=1.16.127
pkgrel=1
pkgdesc="All-in-one workspace for note-taking, learning, organizing thoughts and growing knowledge"
arch=('x86_64' 'aarch64')
depends=(bash electron28) # cur 10.6.194.26-electron.0 , https://releases.electronjs.org/release/v21.3.1
url="https://www.remnote.com"
license=('custom:Commercial')
_appimage="RemNote-${pkgver}.AppImage"
source=("https://download2.remnote.io/remnote-desktop2/RemNote-$pkgver.AppImage")
	#remnote.sh)
sha256sums=('56c4bd4576dcbba695edbf81937941fb1ebf5ff1f1379128ca91429f8a8a3449')
            #'6fabb8dc40b63d8bbc447df45f7b31e7e0b43d30f144496fb7d900542ada2534')

#prepare() {
#	chmod a+x $_appimage
#	./$_appimage --appimage-extract
#	sed -i -e "s|^Exec=.*|Exec=/usr/bin/$pkgname %U|" \
#		-e '/^X-AppImage-Version=.*/d' \
#		-e '/Categories=/s/=/&Office;/' squashfs-root/${pkgname}.desktop
#}
# makepkg is capable of automatically unpacking .AppImage files using bsdtar
prepare() {
	sed -i -e "s|^Exec=.*|Exec=/usr/bin/$pkgname %U|" \
		-e '/^X-AppImage-Version=.*/d' \
		-e '/Categories=/s/=/&Office;/' squashfs-root/${pkgname}.desktop
}

package() {
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	# cp -av "squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
	printf "remove c/cpp file\n"
	find $pkgdir/usr/lib/$pkgname \( -name "*.c" -or -name "*.h" -or -name "*.mk" -or -name "*.Makefile" -or -name "*.cpp" -or -name "*.hpp" \) -print -delete
	# chmod -R 755 "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked"
	install -Dm644 "squashfs-root/remnote.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "squashfs-root/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
