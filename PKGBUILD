# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wlroots-hidpi-git
pkgver=0.16.0.r5476.0326ceff
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
            '2d3736475593a4644e93c839a5d19644551bb459b8a59e8c03c18dfbafeecdfc'
            '89ddc2d7bece7992e9913d03144b475da3c594ff7552ac2da6b5ae4ad6ffe2eb')

_builddir="build"
_builddir_pkgver="build-pkgver"

_meson_setup () {
	arch-meson \
		--buildtype=debug \
		-Dwerror=false \
		-Dexamples=false \
		"${pkgname}" "$1"
}

prepare () {
	(
		cd "${pkgname}"
		patch -Np1 < "${srcdir}/0001-xwayland-add-support-for-global-scale-factor.patch"
		patch -Np1 < "${srcdir}/0002-xwayland-add-support-for-changing-global-scale-facto.patch"
	)

	_meson_setup "${_builddir_pkgver}"
}

pkgver () {
	(
		set -o pipefail
		meson introspect --projectinfo "${_builddir_pkgver}" \
			| awk 'match($0, /"version":\s*"([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)"/, ret) {printf "%s",ret[1]}'
	)
	cd "${pkgname}"
	printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	_meson_setup "${_builddir}"
	meson compile -C "${_builddir}"
}

package () {
	DESTDIR="${pkgdir}" meson install -C build
	install -Dm644 "${pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_upgrade() {
  echo "Make sure to upgrade wlroots-hidpi-git and sway-hidpi-git together."
  echo "Upgrading one but not the other is unsupported."
}
