# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=gnome-theme-manager
pkgname="$_pkgbase-appimage"
pkgver=2.0.0.beta
pkgrel=1
pkgdesc='Application designed to seamlessly browse, download, install, and apply GNOME themes and customizations directly from gnome-look.org'
arch=('x86_64')
url='https://github.com/unaibenidorm/Gnome-Theme-Manager'
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'polkit' 'fuse2')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=('!strip')
_ver="${pkgver%.*}"
_tag="${pkgver##*.}"
_short_ver="${_ver%.*}"
_appimage="Gnome-Theme-Manager-${_ver}-${_tag^}-x86_64.AppImage"
source=("$_appimage::https://github.com/unaibenidorm/Gnome-Theme-Manager/releases/download/${_tag^}-${_short_ver}/$_appimage")
sha256sums=('674ace9a58b888024b525685b35dde0cac694ff4dc2be260632220a189475e85')

prepare() {
	chmod +x "$srcdir/$_appimage"
	cd "$srcdir"
	./"$_appimage" --appimage-extract
}

package() {
	install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$_pkgbase/$_pkgbase.AppImage"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgbase/$_pkgbase.AppImage" "$pkgdir/usr/bin/$_pkgbase"
	install -Dm644 "$srcdir/squashfs-root/usr/share/applications/org.gnome.ThemeManager.desktop" \
		"$pkgdir/usr/share/applications/$_pkgbase.desktop"

	sed -i \
		-e 's|^Exec=.*|Exec=gnome-theme-manager|' \
		-e 's|^Icon=.*|Icon=gnome-theme-manager|' \
		"$pkgdir/usr/share/applications/$_pkgbase.desktop"

	install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/scalable/apps/org.gnome.ThemeManager.svg" \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/gnome-theme-manager.svg"
}
