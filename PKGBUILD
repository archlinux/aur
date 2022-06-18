# Maintainer: Garrett Howard <garrett@mersh.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-xrgb8888-git
pkgver=0.16.0.r5590.d89285f78
pkgrel=1
license=(custom:MIT)
pkgdesc='wlroots-git, with XRGB8888 format patches'
url=https://gitlab.freedesktop.org/wlroots/wlroots
arch=(x86_64)
provides=("libwlroots.so" "wlroots" "wlroots-git" "wlroots=${pkgver%%.r*}")
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
source=("${pkgname}::git+${url}.git"
	"xrgb8888.patch")
md5sums=('SKIP'
         'SKIP')

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
	patch --directory="${pkgname}" --forward --strip=1 --input="${srcdir}/xrgb8888.patch"
	_meson_setup "${_builddir_pkgver}"
}

pkgver () {
	(
		set -o pipefail
		meson introspect --projectinfo "${_builddir_pkgver}" \
		  | awk 'match($0, /"version":\s*"([[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)-dev"/, ret) {printf "%s",ret[1]}'
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
  echo "Make sure to upgrade wlroots-git and sway-git together."
  echo "Upgrading one but not the other is unsupported."
}
