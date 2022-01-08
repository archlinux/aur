# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wlroots-hidpi-git
pkgver=0.16.0.r5318.59b9518f
pkgrel=1
license=(custom:MIT)
pkgdesc='Modular Wayland compositor library, with XWayland HiDPI (git version)'
url=https://gitlab.freedesktop.org/wlroots/wlroots
arch=(x86_64)
provides=("libwlroots.so" "wlroots=${pkgver%%.r*}")
conflicts=(wlroots wlroots-git)
options=(debug)
depends=(
	glslang
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
	vulkan-icd-loader
	vulkan-validation-layers
	xorg-xwayland)
makedepends=(
	git
	meson
	vulkan-headers
	wayland-protocols
	xorgproto)
# https://gitlab.freedesktop.org/MisterDA/wlroots/-/tree/xwayland_hidpi
source=("${pkgname}::git+${url}.git"
        "0001-xwayland-add-support-for-global-scale-factor.patch"
        "0002-xwayland-add-support-for-changing-global-scale-facto.patch"
       )
sha256sums=('SKIP'
            '68f1c7c550a317d8175311325b6c4809b0ec761b0badba7926eca7475d1bc27f'
            '9004f727c18129c667804fa987938c8d4a1a27ec8fed6bb2668f03284a884dcc')

prepare () {
	(
		cd "${pkgname}"
		patch -Np1 < "${srcdir}/0001-xwayland-add-support-for-global-scale-factor.patch"
		patch -Np1 < "${srcdir}/0002-xwayland-add-support-for-changing-global-scale-facto.patch"
	)

	arch-meson \
		--buildtype=debug \
		-Dwerror=false \
		-Dexamples=false \
		"${pkgname}" build
}

pkgver () {
	(
		set -o pipefail
		meson introspect --projectinfo build \
			| awk 'match($0, /"version":\s*"([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)"/, ret) {printf "%s",ret[1]}'
		cd "${pkgname}"
		printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
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
