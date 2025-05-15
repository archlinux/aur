# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: GreyXor <greyxor@protonmail.com>
# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-git
pkgver=0.20.0.r7488.62c86fb9
pkgrel=1
pkgdesc='Modular Wayland compositor library (git development version)'
arch=(x86_64)
url=https://gitlab.freedesktop.org/wlroots/wlroots
license=(MIT)
options=(debug)
depends=(
	glibc
	libdrm
	libinput
	libliftoff
	libxcb
	libglvnd
	lcms2
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
provides=("lib${pkgname%-git}-${pkgver%.*.*.*}.so")
source=("${pkgname}::git+${url}.git")
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
		awk 'match($0, /"version":\s*"([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)-(dev|rc[[:digit:]]+)"/, ret) {printf "%s",ret[1]}'
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
