# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-gtk-git
pkgver=v1.0.1_0_g708de8f0ae86
pkgrel=1
pkgdesc='Write.as GTK desktop app'
arch=('x86_64')
url='https://write.as/apps/desktop'
license=('GPL3')
depends=(
	'gtksourceview3'
)
makedepends=(
	'meson'
	'ninja'
	'vala'
)
optdepends=(
	'writeas-cli: web publishing support'
)
conflicts=('writeas-gtk')
provides=('writeas-gtk')
source=("${pkgname}::git+https://code.as/writeas/writeas-gtk.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags --long | sed s/-/_/g
}

prepare() {
	# The build was failing across versions of meson, so always clean build.
	# Why would anyone use a build system that breaks itself when you update it
	# and requires so much detailed knowledge of how it works to get anything
	# done?
	rm -rf "${srcdir}/build"
	mkdir -p build
}

build() {
	arch-meson "${pkgname}" build
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja install -C build
}
