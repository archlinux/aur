pkgname=identity
pkgver=0.1.2
pkgrel=1
pkgdesc='Compare multiple versions of an image or video'
arch=(x86_64)
url=https://gitlab.gnome.org/YaLTeR/identity
license=(GPL3)
depends=(
	gtk3
	gst-plugin-gtk
	gst-plugins-base
	gst-plugins-good
	'libhandy>=1.0.0'
)
makedepends=(
	meson
	rust
)
source=(https://gitlab.gnome.org/YaLTeR/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha256sums=('48718c939864da8c793072eb2eb481f6e66eabb454efb7d9331f5381ff1785b8')

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
