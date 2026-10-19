# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-git
pkgver=0.21.0.r7943.f9d2520
pkgrel=1
pkgdesc='Modular Wayland compositor library (git development version)'
arch=(x86_64)
url=https://gitlab.freedesktop.org/wlroots/wlroots
license=(MIT)
depends=(
	glibc
	lcms2
	libdisplay-info
	libdrm
	libglvnd
	libinput
	libliftoff
	libxcb
	libxkbcommon
	mesa
	opengl-driver
	pixman
	seatd
	systemd-libs
	vulkan-icd-loader
	wayland
	wayland-protocols
	xcb-util-errors
	xcb-util-renderutil
	xcb-util-wm
)
makedepends=(
	git
	glslang
	hwdata
	meson
	vulkan-headers
	xorg-xwayland
)
optdepends=(
	'vulkan-validation-layers: debug the Vulkan renderer'
	'xorg-xwayland: enable X11 support'
)
provides=(
	"wlroots${pkgver%.*.*.*}=${pkgver}"
	"libwlroots-${pkgver%.*.*.*}.so"
)
conflicts=("wlroots${pkgver%.*.*.*}")
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	local ver
	ver=$(meson introspect --projectinfo meson.build 2>/dev/null |
		python -c 'import json, sys; print(json.load(sys.stdin)["version"].split("-")[0])') || return
	printf '%s.r%s.%s' "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	arch-meson "${pkgname}" build \
		-D examples=false \
		-D werror=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
	install -Dm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
