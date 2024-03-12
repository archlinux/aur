# Maintainer: Vladislav Titov <vtitov at gmx dot com>
_pkgname=acreom
pkgname=acreom-bin
pkgver=1.16.1
_appimage=acreom-$pkgver.AppImage
pkgrel=1
pkgdesc="A powerful knowledge base integrated with time management running on local markdown files"
arch=('x86_64')
url="https://github.com/Acreom/releases"
license=('custom:Commercial')
provides=("acreom=${pkgver}")
conflicts=('acreom')
options+=('!strip')
source=("$url/releases/download/v$pkgver/$_appimage")
noextract=($_appimage)
sha256sums=('b14d704f1431c1ff9d45ccde6495c3ee939334c632aaf443639828ca3b38b032')

prepare() {
	chmod +x ${_appimage}
	./$_appimage --appimage-extract $_pkgname.desktop
	./$_appimage --appimage-extract usr/share/icons/hicolor/0x0/apps/$_pkgname.png
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$_pkgname/$_appimage"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_appimage" "$pkgdir/usr/bin/$_pkgname"

	sed -i "s|Exec=AppRun --no-sandbox %U|Exec=/usr/bin/$_pkgname --no-sandbox %U|" "$srcdir/squashfs-root/$_pkgname.desktop"
	install -Dm644 "$srcdir/squashfs-root/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/0x0/apps/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
