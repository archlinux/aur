# Contributor: Asuka Minato
pkgname=caido-desktop
pkgver=0.28.0
_commit=9799aa77
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64)
url="https://caido.io/"
license=('private')
depends=(glibc gcc-libs cairo glib2 hicolor-icon-theme dbus gtk3 gdk-pixbuf2 webkit2gtk pango)
provides=(caido caido-backend)
source=("https://storage.googleapis.com/caido-releases/v${pkgver}/caido-desktop-linux-v${pkgver}-${_commit}.AppImage")
sha256sums=('9799aa77802b7d7ab320adc16b9cd3bc1e1e7de2abe9ee7c71d4b9989fcc2222')

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
