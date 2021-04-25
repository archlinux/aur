# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wlroots-hidpi-git
pkgver=0.13.0.r61.gce30a221
pkgrel=1
license=(custom:MIT)
pkgdesc='Modular Wayland compositor library, with XWayland HiDPI (git version)'
url=https://github.com/swaywm/wlroots
arch=(x86_64)
provides=("wlroots-hidpi=${pkgver%%.r*}"
          "wlroots=${pkgver%%.r*}"
          "wlroots-git")
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
	systemd)
makedepends=(
	git
	meson
	wayland-protocols
	xorgproto)
source=("${pkgname}::git+${url}"
        # "xwayland_hidpi.diff::https://github.com/swaywm/wlroots/pull/2064.diff"
        "xwayland_hidpi.diff::https://github.com/swaywm/wlroots/compare/master...MisterDA:xwayland_hidpi.diff"
       )
sha512sums=('SKIP'
            'a47b8fc69558ed4f6e4e45903cae7cba6877fc1358b7b381995cb0fe3c180084367013abda92fc6b91f1ff11b14aced0542e64be8ee006e54a7dfd6106c44628')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	cd "${pkgname}"
	patch --forward --strip=1 --input="${srcdir}/xwayland_hidpi.diff"
}

build () {
	arch-meson \
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
  echo "Make sure to upgrade wlroots-hidpi-git and sway-hidpi-git together."
  echo "Upgrading one but not the other is unsupported."
}
