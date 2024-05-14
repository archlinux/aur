# Maintainer:  sandwich <sandwich at archworks dot co>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: GreyXor <greyxor@protonmail.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>

pkgname=wlroots-displaylink-git
pkgver=0.18.0.r7000.7e5bf4ae
pkgrel=4
pkgdesc='Modular Wayland compositor library (git development version)'
arch=(x86_64)
url=https://gitlab.freedesktop.org/kennylevinsen/wlroots
license=(MIT)
options=(!debug)
depends=(
	glibc
	libdrm
	libinput
	libliftoff
	libxcb
	libglvnd
	libxkbcommon
	systemd-libs
	opengl-driver
	pixman
	wayland
	xcb-util-errors
	xcb-util-renderutil
	xcb-util-wm
	seatd
	glslang
	vulkan-icd-loader
	libdisplay-info)
makedepends=(
	git
	meson
	vulkan-headers
	wayland-protocols
	xorgproto
	xorg-xwayland
)
optdepends=(
	'xorg-xwayland: enable X11 support'
)
provides=("libwlroots.so" "${pkgname%-displaylink-git}=${pkgver%%.r*}" "wlroots-git")
conflicts=("wlroots" "wlroots-git")
source=("${pkgname}::git+${url}.git#branch=displaylink-hack")
b2sums=('SKIP')
_builddir="build"
_builddir_pkgver="build-pkgver"

_meson_setup() {
	arch-meson \
		--buildtype=debug \
		-Dwerror=false \
		-Dexamples=false \
		"${pkgname}" "$1"
}

prepare() {
	_meson_setup "${_builddir_pkgver}"
}

pkgver() {
	(
		set -o pipefail
		meson introspect --projectinfo "${_builddir_pkgver}" |
			awk 'match($0, /"version":\s*"([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)-dev"/, ret) {printf "%s",ret[1]}'
	)
	cd "${pkgname}"
	printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	_meson_setup "${_builddir}"
	meson compile -C "${_builddir}"
}

package() {
	meson install -C "${_builddir}" --destdir="${pkgdir}"
	install -Dm644 "${pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
