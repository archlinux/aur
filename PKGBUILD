# Maintainer: Simon Pera <simon@nextmiracle.eu>
# Contributor: Previous maintainer's Jonne Haß <me@jhass.eu>
pkgname=workflowy
pkgver=4.3.2512041349
pkgrel=1
pkgdesc="Desktop app for workflowy.com, a note taking tool based on lists"
arch=('x86_64')
url="https://workflowy.com"
license=('custom')
depends=('fuse2')
_filename="$pkgname-$pkgver.AppImage"
_downloadname="WorkFlowy-x86_64.AppImage"
#!debug added to work around : https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/19
options=('!strip' '!debug')
noextract=("$_filename")
source=("$_filename::https://github.com/workflowy/desktop/releases/download/v${pkgver/_/-}/$_downloadname")

prepare() {
	cd "$srcdir"
	rm -rf squashfs-root
	chmod +x $_filename
	./$_filename --appimage-extract
	sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /opt/$_downloadname|" squashfs-root/workflowy.desktop
}

package() {
	cd "$srcdir/"
	install -Dm755 $_filename "$pkgdir/opt/$_downloadname"
	install -Dm644 squashfs-root/workflowy.desktop "$pkgdir/usr/share/applications/workflowy.desktop"
	install -dm755 "$pkgdir/usr/share/icons/hicolor"
	cp -av squashfs-root/usr/share/icons/hicolor/* "$pkgdir/usr/share/icons/hicolor/"
	chmod -R a+rX "$pkgdir/usr/share/icons/hicolor"
}
sha256sums=('0ea5cf88af3758f74c3ea8e1c987b79dd91efda47aebbc67e481533d83a2d277')
