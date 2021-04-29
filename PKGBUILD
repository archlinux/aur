# Maintainer: Josip Janzic <me@josip.dev>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-hi-res-scroll-git
pkgver=0.13.0.r95.g8e9e6e1a
pkgrel=1
license=(custom:MIT)
pkgdesc='Modular Wayland compositor library with hi-res scroll patches (git version)'
url=https://github.com/janza/wlroots
arch=(x86_64)
provides=("wlroots=${pkgver%%.r*}" "wlroots-git")
conflicts=(wlroots)
options=(debug)
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
	systemd
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
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	arch-meson \
		--buildtype=debug \
		-Dlogind-provider=systemd \
		-Dlibseat=enabled \
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
  echo "Make sure to upgrade wlroots-git and sway-git together."
  echo "Upgrading one but not the other is unsupported."
}
