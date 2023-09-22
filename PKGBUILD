# Maintainer: Tommaso Dordoni <t dot dordoni dot aur at outlook dot com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=icedrive-appimage
pkgver=2.0
pkgrel=1
pkgdesc='A secure and fast cloud storage with Twofish encryption (portable app)'
arch=('x86_64')
url='https://icedrive.net'
license=('custom')
depends=(
	'fuse2'
	'zlib'
	'hicolor-icon-theme'
)
options=(!strip)
source=("https://cdn.icedrive.net/static/apps/portable/Icedrive_Portable-$CARCH-$pkgver.AppImage")
sha512sums=('SKIP')

prepare() {
	chmod a+x $srcdir/Icedrive_Portable-$CARCH-$pkgver.AppImage
	$srcdir/Icedrive_Portable-$CARCH-$pkgver.AppImage --appimage-extract

	sed '/^Exec=/ s/Icedrive/\/usr\/bin\/icedrive/g' -i "$srcdir/squashfs-root/Icedrive.desktop"
}

package() {
	# AppImage
	install -Dm755 "$srcdir/Icedrive_Portable-$CARCH-$pkgver.AppImage" "$pkgdir/opt/${pkgname//-appimage/""}/Icedrive_Portable-$CARCH-$pkgver.AppImage"

	# Desktop file
	install -Dm755 "$srcdir/squashfs-root/Icedrive.desktop" "$pkgdir/usr/share/applications/${pkgname//-appimage/""}.desktop"

	# Icon
	install -Dm645 "$srcdir/squashfs-root/usr/bin/Icedrive.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/Icedrive.png"

    # Symlink executable
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname//-appimage/""}/Icedrive_Portable-$CARCH-$pkgver.AppImage" "$pkgdir/usr/bin/${pkgname//-appimage/""}"
}
