# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=wlroots-0.19-git
pkgver=0.19.0
pkgrel=1
pkgdesc='Modular Wayland compositor library (0.19.0 version)'
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
provides=("libwlroots-0.19.so")
source=("${pkgname}::git+${url}")
b2sums=('SKIP')
_builddir="build"

prepare() {
	meson setup \
		--buildtype=debug \
		-Dwerror=false \
		-Dexamples=false \
		"${pkgname}" "${_builddir}"
}

build() {
    cd "$srcdir/$pkgname"
	git checkout 0.19.0
    # export PKG_CONFIG_PATH="/usr/lib/wlroots0.17/pkgconfig/"
    meson setup --buildtype=debug --prefix /usr "$srcdir/build"
    ninja -C "$srcdir/build"
}

package() {
	meson install -C "${_builddir}" --destdir="${pkgdir}"
	install -Dm644 "${pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}