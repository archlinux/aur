# Contributor: Danilo Bargen <aur ät dbrgn döt ch>
# Maintainer: monosans
# Based on wlroots-git PKGBUILD
pkgname=wlroots-eglstreams-git
pkgver=0.16.0.r5636.6ea54173
pkgrel=1
license=(MIT)
pkgdesc='Modular Wayland compositor library with EGLStreams support (git version)'
url=https://github.com/danvd/wlroots-eglstreams
arch=(x86_64)
provides=("libwlroots.so" "wlroots=${pkgver%%.r*}" wlroots-git)
conflicts=(wlroots wlroots-git)
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
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

_builddir="build"
_builddir_pkgver="build-pkgver"

_meson_setup() {
	arch-meson \
		--buildtype=release \
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
	DESTDIR="${pkgdir}" meson install -C build
	install -Dm644 "${pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_upgrade() {
	echo "Make sure to upgrade wlroots-eglstreams-git and sway-git together."
	echo "Upgrading one but not the other is unsupported."
}
# vim:set ts=4 sw=4 noet:
