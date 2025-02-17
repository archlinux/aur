# Maintainer: Asuka Minato <youremail@domain.com>
pkgname=clone-tracker
pkgver=1.22.0
pkgrel=1
pkgdesc="コピペコードに悩まされてきた開発環境へスマートなコード管理を実現"
arch=(x86_64)
url="https://clonetracker.com"
license=('custom')
depends=(webkit2gtk
	libsoup
	gdk-pixbuf2
	bash
	glibc
	pango
	gtk3
	zlib
	perl
	gcc-libs
	glib2
	cairo
	hicolor-icon-theme
)
source=("https://clonetracker.com/dl/clone-tracker_${pkgver}_amd64.AppImage")
sha256sums=('286359478deffbef57e2653f40a8e4eb18adb34686e47d2be7bc792b83b0df0c')
options=(!emptydirs)

prepare() {
	chmod +x ./*.AppImage
	./*.AppImage --appimage-extract
	pushd squashfs-root
	rm usr/lib/lib*
	rm -r usr/share/glib-2.0
	rm usr/bin/xdg-open
	rm -r usr/lib/x86_64-linux-gnu/{gtk-3.0,gdk-pixbuf-2.0,webkit2gtk-4.0,gio}
	find . -xtype l -delete
	find . -name "*.desktop" -print -exec sed -i 's/Exec=.*/Exec=GDK_BACKEND=x11 clone-tracker/' {} \;
	popd
	rm *.AppImage
}

package() {
	cp -av $srcdir/squashfs-root/usr $pkgdir
}
