# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gtksourceview5
pkgver=5.3.2
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
b2sums=('6bfb62128e224aa9ef2d4ebcfbff3ea4b12204b2ce7ed323dc6e436ac0461164257d5182d260b92476130bc6b3f929411b7b664a1f4e907a5cf604d6db6037f9')

build() {
	arch-meson gtksourceview-${_commit} build -D gtk_doc=true
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
