# Maintainer: Thomas Booker <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=phoc-embedded-wlroots
pkgver=0.30.0
pkgrel=1
pkgdesc='A pure Wayland shell prototype for GNOME on mobile devices (wlroots embedded)'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/World/Phosh/phoc'
license=(GPL3)
depends=(
	gobject-introspection
	gnome-desktop
	libinput
	mutter
	libseat.so
	xcb-util-errors
	xcb-util-wm
	xcb-util-renderutil
	glslang
)
makedepends=(
	meson
	git
	vulkan-headers
	wayland-protocols
	xorg-xwayland
	xorg-server-xvfb
)
provides=(phoc)
conflicts=(phoc wlroots)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

pkgver() {
	cd phoc
	git describe --tags | sed 's/^v//'
}

prepare() {
	cd phoc

	meson subprojects download

	git submodule update --init
}

build() {
	arch-meson phoc build -Dembed-wlroots=enabled --default-library=static -Dtests=true
	ninja -C build
}

# Xwayland test fails in distrobox so disabling test for now
# check() {
# 	xvfb-run ninja -C build test
# }

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
