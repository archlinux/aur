# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-asan-git
_pkgname=wlroots
pkgver=0.16.0.r5387.e279266f
pkgrel=1
license=(custom:MIT)
pkgdesc='Modular Wayland compositor library (git version, with address sanitizer)'
url=https://gitlab.freedesktop.org/wlroots/wlroots
arch=(x86_64)
provides=("libwlroots.so" "wlroots=${pkgver%%.r*}" "wlroots-git=${pkgver}")
conflicts=(wlroots)
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
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

_meson_configure() {
	local _builddir="$1"
	CFLAGS="$CFLAGS -fsanitize=address,undefined" arch-meson \
		--buildtype=debug \
		-Dwerror=false \
		-Dexamples=false \
		"${_pkgname}" "${_builddir}"
}

prepare () {
	_meson_configure build-pkgver
}

pkgver () {
	(
		set -o pipefail
		meson introspect --projectinfo build-pkgver \
		  | awk 'match($0, /"version":\s*"([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)"/, ret) {printf "%s",ret[1]}'
	)
	cd "${_pkgname}"
	printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	_meson_configure build
	meson compile -C build
}

package () {
	DESTDIR="${pkgdir}" meson install -C build
	install -Dm644 "${_pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

post_upgrade() {
  echo "Make sure to upgrade wlroots-git and sway-git together."
  echo "Upgrading one but not the other is unsupported."
}
