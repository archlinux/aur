# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wlroots-hidpi-git
pkgver=0.14.0.r28.ga38baec1
pkgrel=1
license=(custom:MIT)
pkgdesc='Modular Wayland compositor library, with XWayland HiDPI (git version)'
url=https://github.com/swaywm/wlroots
arch=(x86_64)
provides=("libwlroots.so" "wlroots=${pkgver%%.r*}")
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
	libseat
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
            'eade099a5db472a3feb6617a03c588e04a980ee474211461bc5d69dcaf09493f6ce55498e649aadf5808a996e52abb24cc32d9107e8400bf93ea17d2f6ba1a2a')

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
