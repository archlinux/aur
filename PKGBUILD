# Contributor: Asuka Minato
pkgname=caido-desktop
pkgver=0.27.2
_commit=c24cf3bd
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64)
url="https://caido.io/"
license=('private')
depends=(glibc gcc-libs cairo glib2 hicolor-icon-theme dbus gtk3 gdk-pixbuf2 webkit2gtk pango)
provides=(caido caido-backend)
source=("https://storage.googleapis.com/caido-releases/v${pkgver}/caido-desktop-linux-v${pkgver}-${_commit}.AppImage")
sha256sums=('c24cf3bdb87436502c18cc4919ae6e423f2ba0880375f44eab6e80dd2a40a054')

prepare() {
	chmod +x *.AppImage
	./*.AppImage --appimage-extract
	mv squashfs-root/* ./
	rm -vrf ./usr/{lib,share/glib-2.0}
}

package() {
	cp -av usr $pkgdir/
	# fix https://bugs.webkit.org/show_bug.cgi?id=256663
	sed -i "s/Exec=caido/Exec=JSC_useDFGJIT=0 caido/" $pkgdir/usr/share/applications/*.desktop
}
