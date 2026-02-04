# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
pkgname=dred
pkgdesc="Fast, ultra-lightweight graphical text editor"
pkgver=0.4.3
pkgrel=2
arch=('x86_64')
url="https://dred.io/"
license=('MIT')
depends=('gtk3' 'harfbuzz' 'pango' 'cairo' 'hicolor-icon-theme' 'glibc' 'at-spi2-core' 'zlib' 'glib2' 'gdk-pixbuf2')
makedepends=('gcc')
source=(https://github.com/mackron/dred/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('6a0fc9b70d1c539e14921bba0ae24cc54de5637733f11f2e117bd8c9e9b92e7f')

prepare() {
	cd $pkgname-$pkgver/source/$pkgname/dtk
	# These are from https://github.com/mackron/dred/pull/33
	# Needed to compile Dred
	sed --in-place '569i\/*GdkCursor**/dtk_ptr pCursorHand;\' dtk.h
	sed --in-place '821s/.*/if (pOptions->pDefaultExtension != NULL) {/' dtk_dialogs.c
	# This is so that Dred can use dark mode for the menu bar
	sed --in-place '1720i\g_object_set(gtk_settings_get_default(),"gtk-application-prefer-dark-theme", TRUE, NULL);\' dtk_window.c
}
build() {
	cd $pkgname-$pkgver
	cc source/$pkgname/dred_main.c -o dred $(pkg-config --cflags --libs gtk+-3.0) -lm -ldl
}
package() {
	cd $pkgname-$pkgver
	install -Dm744 LICENSE "$pkgdir/usr/share/licenses/dred/LICENSE"
	install -Dm755 dred "$pkgdir/usr/bin/dred"
	cd resources
	install -Dm755 unix/dred.desktop "$pkgdir/usr/share/applications/dred.desktop"
	install -Dm744 branding/dred_appicon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dred_appicon.svg"
}
