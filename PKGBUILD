# Maintainer: Aron Young <tkf6fkt at gmail dot com>
_pkgname=obsidian
pkgname=obsidian-bin
pkgver=1.4.16
_appimage=Obsidian-$pkgver.AppImage
pkgrel=1
pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files"
arch=('x86_64')
url="https://github.com/obsidianmd/obsidian-releases"
license=('custom:Commercial')
conflicts=('obsidian')
options+=('!strip')
source=("$url/releases/download/v$pkgver/$_appimage")
noextract=($_appimage)
sha256sums=('821ae29478809a6cb40d17810e0b5304c8c9c334035f3633337d3044fe932a81')

prepare() {
	chmod +x ${_appimage}
	./$_appimage --appimage-extract $_pkgname.desktop
	./$_appimage --appimage-extract usr/share/icons/hicolor/128x128/apps/$_pkgname.png
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$_pkgname/$_appimage"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_appimage" "$pkgdir/usr/bin/$_pkgname"

	sed -i "s|Exec=AppRun --no-sandbox %U|Exec=/usr/bin/$_pkgname --no-sandbox %U|" "$srcdir/squashfs-root/$_pkgname.desktop"
	install -Dm644 "$srcdir/squashfs-root/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/128x128/apps/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
