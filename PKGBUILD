# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>
# Maintainer: monosans
# Based on wlroots-git PKGBUILD
pkgname=wlroots-eglstreams-git
pkgver=0.14.1.r5114.fef636e2
pkgrel=1
license=(MIT)
pkgdesc='Modular Wayland compositor library with EGLStreams support (git version)'
url=https://github.com/danvd/wlroots-eglstreams
arch=(x86_64)
provides=("libwlroots.so" "wlroots=${pkgver%%.r*}" wlroots-git)
conflicts=(wlroots wlroots-git)
depends=(
	libinput
	libxcb
	libxkbcommon
	opengl-driver
	pixman
	wayland
	xcb-util-errors
	xcb-util-renderutil
	xcb-util-wm
	seatd
	xorg-xwayland)
makedepends=(
	git
	meson
	wayland-protocols
	xorgproto)
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	echo ${pkgver%%.r*}.r"$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

build () {
	arch-meson \
		--buildtype=release \
		-Dwerror=false \
		-Dexamples=false \
		"${pkgname}" build
	meson compile -C build
}

package () {
	DESTDIR="${pkgdir}" meson install -C build
	install -Dm644 "${pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_upgrade() {
	echo "Make sure to upgrade wlroots-eglstreams-git and sway-git together."
	echo "Upgrading one but not the other is unsupported."
}
# vim:set ts=4 sw=4 noet:
