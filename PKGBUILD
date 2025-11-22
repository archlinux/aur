# Maintainer: Syaddad Ali Sulaiman Hakim <contact@mail.whysadad.com>
pkgname=upnote-appimage
_pkgname=UpNote
pkgver=9.14.20
pkgrel=1
pkgdesc="Cross-platform note-taking application"
arch=('x86_64')
url="https://getupnote.com/"
license=('custom')
provides=('upnote')
conflicts=('upnote')
options=('!strip')
source=("${_pkgname}-${pkgver}.AppImage::https://download.getupnote.com/app/UpNote.AppImage"
        "upnote.desktop")
sha256sums=('144dab5115045c9c380389b556e6835beb9dec5114d3ffc2c65468386e6e50c6'
            '430e558daaf1a5eeaa65a3e2d1fc1841072d4dda9cb6d30504285efb3ae88f1e')

package() {
	cd "$srcdir"

	install -Dm755 "${_pkgname}-${pkgver}.AppImage" "$pkgdir/usr/bin/upnote"
	install -Dm644 "upnote.desktop" "$pkgdir/usr/share/applications/upnote.desktop"

	chmod +x "${_pkgname}-${pkgver}.AppImage"
	./"${_pkgname}-${pkgver}.AppImage" --appimage-extract &>/dev/null

	if [ -f "squashfs-root/upnote.png" ]; then
		install -Dm644 "squashfs-root/upnote.png" "$pkgdir/usr/share/pixmaps/upnote.png"
	elif [ -f "squashfs-root/upnote.svg" ]; then
		install -Dm644 "squashfs-root/upnote.svg" "$pkgdir/usr/share/pixmaps/upnote.svg"
	elif [ -f "squashfs-root/icon.png" ]; then
	    install -Dm644 "squashfs-root/icon.png" "$pkgdir/usr/share/pixmaps/upnote.png"
	else
		msg2 "Warning: Could not automatically find an icon file (upnote.png/svg or icon.png) within the AppImage."
		msg2 "         Desktop entry icon might be missing."
	fi

	find squashfs-root -maxdepth 1 -iname 'LICENSE*' -print -exec install -Dm644 {} "$pkgdir/usr/share/licenses/$pkgname/LICENSE" \; || true

}
