# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=libhandy1-wip-git
pkgver=0.85.0.r41.g75a5abd
pkgrel=1
pkgdesc="Library full of GTK+ widgets for mobile phones"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.gnome.org/GNOME/libhandy"
license=('LGPL2.1')
depends=('gtk3')
makedepends=('git' 'glade' 'gobject-introspection' 'meson' 'vala')
checkdepends=('xorg-server-xvfb')
provides=("${pkgname%-git}" 'libhandy1' 'libhandy-1.so')
conflicts=("${pkgname%-git}" 'libhandy1')
source=('git+https://gitlab.gnome.org/GNOME/libhandy.git#branch=wip/haecker-felix/flap-widget')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/libhandy"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson libhandy build -Dgtk_doc=true -Dexamples=false
	meson compile -C build
}

check() {
	dbus-run-session xvfb-run \
		-s '-screen 0 1920x1080x24 -nolisten local' \
		meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
