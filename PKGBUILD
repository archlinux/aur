# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>
# Forked from wlroots-git PKGBUILD in early May 2021
pkgname=wlroots-eglstreams-git
pkgver=0.12.0.r518.g42d5ba18
pkgrel=1
license=(custom:MIT)
pkgdesc='Modular Wayland compositor library with EGLStream support (git version)'
url=https://github.com/danvd/wlroots-eglstreams
arch=(x86_64)
provides=("wlroots=${pkgver%%.r*}" wlroots-git)
conflicts=(wlroots wlroots-git)
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
	xorgproto
)
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
  echo "Make sure to upgrade wlroots-eglstream-git and sway-git together."
  echo "Upgrading one but not the other is unsupported."
}
