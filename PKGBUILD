# Maintainer: Thomas Booker <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=phosh-git
pkgver=0.20.0.r22.g1c471472
pkgrel=1
pkgdesc='A pure Wayland shell prototype for GNOME on mobile devices'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/World/Phosh/phosh'
license=(GPL3)
depends=(
	callaudiod
	feedbackd
	libhandy
	phoc
	polkit
)
makedepends=(
	ctags
	git
	meson
	vala
	wayland-protocols
)
provides=(phosh)
conflicts=(phosh)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd phosh
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd phosh

	git submodule init
	git submodule update
}

build() {
	# If we don't set `libexecdir` then meson will try and place the phosh bin in /lib/phosh and collide with the dir so we put it in /lib/phosh/phosh
	arch-meson --libexecdir="/usr/lib/phosh" -D tests=false -D systemd=true phosh _build 
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
