# Creator: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Artem Vasilev <artem.vasilev@rwth-aachen.de>
# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=duckstation-qt-bin
_pkgname="${pkgname%-bin}"
_fullname=org.duckstation.DuckStation
pkgver=0.1.r7663
pkgrel=1
pkgdesc="Fast PlayStation 1 emulator for PC and Android"
arch=('x86_64')
url='https://github.com/stenzek/duckstation'
license=('CC-BY-NC-ND-4.0')
provides=("$_pkgname" 'duckstation')
options=('!strip')
noextract=("${_pkgname}-${pkgver}.AppImage")
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage")
sha256sums=('1c474fa1b913cad1318c22cf5c8cd5cfb2643c033007cb134d7870f05b8aa9e6')

package() {
	chmod 755 "$srcdir/${_pkgname}-${pkgver}.AppImage"
	"$srcdir/${_pkgname}-${pkgver}.AppImage" --appimage-extract
	install -Dm644 "squashfs-root/${_fullname}.png" -t "$pkgdir/usr/share/pixmaps"
	install -Dm644 "squashfs-root/${_fullname}.desktop" -t "$pkgdir/usr/share/applications"
	install -d "$pkgdir/opt"
	cp -avR squashfs-root/ "$pkgdir/opt/$_pkgname"
	cat <<- EOF > "${_pkgname}.sh"
		#!/bin/sh
		cd /opt/$_pkgname && ./AppRun
	EOF
	install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/$_pkgname"
	find "$pkgdir/opt/$_pkgname" -type d -exec chmod 755 {} +
}
