# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gtksourceview5
pkgver=5.3.1
pkgrel=1
pkgdesc='A text widget adding syntax highlighting and more to GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/gtksourceview'
license=(LGPL)
depends=(gtk4)
makedepends=(
	gi-docgen
	gobject-introspection
	gtk-doc
	meson
	vala
)
checkdepends=(xorg-server-xvfb)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/gtksourceview-${_commit}.tar.gz")
b2sums=('SKIP')

build() {
	arch-meson gtksourceview-${_commit} build -D gtk_doc=true
	meson compile -C build
}

check() {
	dbus-run-session xvfb-run \
		-s '-screen 0 1920x1080x24 -nolisten local' \
		meson test -C build --print-errorlogs || true
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
