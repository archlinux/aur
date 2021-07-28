# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gtksourceview5
pkgver=5.1.0
pkgrel=1
pkgdesc='A text widget adding syntax highlighting and more to GNOME'
url='https://gitlab.gnome.org/GNOME/gtksourceview'
license=('LGPL')
arch=(x86_64 aarch64)
depends=(gtk4)
makedepends=(
	gobject-introspection
	gtk-doc
	meson
	vala
)
checkdepends=(xorg-server-xvfb)
source=("${url}/-/archive/${pkgver}/gtksourceview-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	arch-meson gtksourceview-${pkgver} build -D gtk_doc=true
	meson compile -C build
}

check() {
	dbus-run-session xvfb-run \
		-s '-screen 0 1920x1080x24 -nolisten local' \
		meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
