# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=identity-git
pkgver=0.1.3.r18.g266a8c3
pkgrel=1
pkgdesc='Compare multiple versions of an image or video'
arch=(x86_64)
url=https://gitlab.gnome.org/YaLTeR/identity
license=(GPL3)
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugin-gtk' 'gtk4' 'libadwaita')
makedepends=('blueprint-compiler-git' 'git' 'meson' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${pkgname%-git}
	# Binary conflict with mesa-demos
	sed -i "s/output: meson.project_name()/output: 'identity-compare'/g" src/meson.build
	sed -i "s/Exec=identity/Exec=identity-compare/g" data/org.gnome.gitlab.YaLTeR.Identity.desktop.in.in
}

build() {
	arch-meson ${pkgname%-git} build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
