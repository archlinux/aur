pkgname=identity
pkgver=0.3.0
pkgrel=1
pkgdesc='Compare multiple versions of an image or video'
arch=(x86_64)
url=https://gitlab.gnome.org/YaLTeR/identity
license=(GPL3)
depends=(
	gtk4
	gstreamer
	libadwaita
)
makedepends=(
	meson
	rust
)
source=(https://gitlab.gnome.org/YaLTeR/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha256sums=('f6769bcbda3cc099764a9960a0c7e4a40de0e6d8931b0b788b45021e7b42e5c7')

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
