# Maintainer: Thomas Booker <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=phosh
pkgver=0.21.0
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
	evolution-data-server
	upower
	libnm
)
makedepends=(
	ctags
	git
	meson
	vala
	wayland-protocols
)
_tag=4122630266abfd6623e169330da6e7d6bc01be7f # git rev-parse v${pkgver}
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
	cd phosh
	git describe --tags | sed 's/^v//'
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
