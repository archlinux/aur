# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=totem-git
pkgver=42.0+r69+g2c7772ef4
pkgrel=1
pkgdesc='Movie player for the GNOME desktop based on GStreamer'
url='https://wiki.gnome.org/Apps/Videos'
arch=(x86_64 aarch64)
license=(GPL2 custom)
depends=(
	gnome-desktop
	grilo
	gst-plugin-gtk
	gst-plugins-bad
	gst-plugins-base
	gst-plugins-good
	libhandy
	libpeas
	libportal-gtk3
	python-gobject
)
makedepends=(
	appstream-glib
	docbook-xsl
	git
	gobject-introspection
	gtk-doc
	intltool
	itstool
	libnautilus-extension
	meson
	python-pylint
)
optdepends=(
	'grilo-plugins: Media discovery'
	'gst-libav: Extra media codecs'
	'gst-plugins-ugly: Extra media codecs'
)
provides=(totem)
conflicts=(totem)
source=(
	"git+https://gitlab.gnome.org/GNOME/totem.git"
	"git+https://gitlab.gnome.org/GNOME/libgd.git"
)
b2sums=('SKIP' 'SKIP')

pkgver() {
	cd totem
	git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
	cd totem

	git submodule init
	git submodule set-url subprojects/libgd "$srcdir/libgd"
	git submodule update
}

build() {
	arch-meson totem build -D enable-gtk-doc=true
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 totem/COPYING
}
