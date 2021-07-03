# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.8.1
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-python' 'python-gobject' 'gst-plugin-gtk' 'gst-plugins-good' 'libnm'
         'python-pillow' 'python-logbook' 'python-single-version' 'zbar'
         'python-kiss-headers')
makedepends=('git' 'meson' 'gobject-introspection')
checkdepends=('appstream-glib')
_commit=ca5e48a5aba8f842d2026479d40f59c3919fa501
source=("$pkgname::git+https://github.com/hongquan/CoBang.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd "$srcdir/$pkgname"

	# Fix version in About dialog
	sed -i "s/version: '0.8.0'/version: '0.8.1'/g" meson.build
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
