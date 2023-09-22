pkgname=identity
<<<<<<< HEAD
pkgver=0.5.0
=======
pkgver=0.6.0
>>>>>>> 4b062e9 (update to 0.6.0)
pkgrel=1
pkgdesc='Compare multiple versions of an image or video'
arch=(x86_64)
url=https://gitlab.gnome.org/YaLTeR/identity
license=(GPL3)
depends=(
	gstreamer
	libadwaita
	dav1d
	libwebp
	gst-plugin-gtk4
)
makedepends=(
	meson
	rust
	blueprint-compiler
	gobject-introspection
	python-gobject
)
source=(https://gitlab.gnome.org/YaLTeR/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha256sums=('5ae1ef8129dab503d49ecae984021710c9df5f322b054c7ac2f488747b0d76e0')

prepare() {
	cd ${pkgname}-v${pkgver}
	# Binary conflict with mesa-demos
	sed -i "s/output: meson.project_name()/output: 'identity-compare'/g" src/meson.build
	sed -i "s/Exec=identity/Exec=identity-compare/g" data/org.gnome.gitlab.YaLTeR.Identity.desktop.in.in
}

build() {
	arch-meson ${pkgname}-v${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" ninja install -C build
}
