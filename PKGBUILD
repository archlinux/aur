# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Aron Young <tkf6fkt at gmail dot com>
# Contributor: asuka minato
# Maintainer: tristanrw <hidden>

pkgname=remnote
pkgver=1.16.129
pkgrel=3
pkgdesc="All-in-one workspace for note-taking, learning, organizing thoughts and growing knowledge"
arch=('x86_64' 'aarch64')
depends=(bash electron28)
url="https://www.remnote.com"
license=('custom:Commercial')
_appimage="RemNote-${pkgver}.AppImage"
source=("https://download2.remnote.io/remnote-desktop2/RemNote-$pkgver.AppImage"
	remnote.sh)
sha256sums=('25df10fccb7d50b301cdf8bc1627f97d232b0bc475ac71fbdb6ee4ffce1d96ae'
            '42aeb6d5c89ab3e15d44617c06f50082cfdb57bce78b04bdf8885b41bf6bd293')

prepare() {
    chmod a+x $_appimage
    ./$_appimage --appimage-extract #extract elecron-app from appimage
	sed -i -e "s|^Exec=.*|Exec=/usr/bin/$pkgname %U|" \
		-e '/^X-AppImage-Version=.*/d' \
		-e '/Categories=/s/=/&Office;/' squashfs-root/${pkgname}.desktop
}
# insert script into desktop-entry to force correct electron-version for electron-app

package() {
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	# cp -av "squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
	printf "remove c/cpp files\n"
	find $pkgdir/usr/lib/$pkgname \( -name "*.c" -or -name "*.h" -or -name "*.mk" -or -name "*.Makefile" -or -name "*.cpp" -or -name "*.hpp" \) -print -delete
	# chmod -R 755 "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked"
	install -Dm644 "squashfs-root/remnote.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "squashfs-root/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
