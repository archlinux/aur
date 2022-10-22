pkgname=identity
pkgver=0.4.0
pkgrel=1
pkgdesc='Compare multiple versions of an image or video'
arch=(x86_64)
url=https://gitlab.gnome.org/YaLTeR/identity
license=(GPL3)
depends=(
	gstreamer
	libadwaita
)
makedepends=(
	meson
	rust
	blueprint-compiler
	gobject-introspection
	python-gobject
)
source=(https://gitlab.gnome.org/YaLTeR/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha256sums=('2a6da7d25e21939f545d36dddca06b82ddda2580b9f083f2b22f9cdb527c4c37')

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

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
