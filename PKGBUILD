# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=wlroots-0.19-mao-git
pkgver=0.19.0
pkgrel=1
pkgdesc='Modular Wayland compositor library (0.19.0 version with fixed patch)'
arch=(x86_64)
url=https://github.com/DreamMaoMao/wlroots
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
conflicts=("wlroots-0.19-git" "wlroots0.19")
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
	  git checkout 0.19.0-fix
    meson setup --buildtype=debug --prefix /usr "$srcdir/build"
    ninja -C "$srcdir/build"
}

package() {
	meson install -C "${_builddir}" --destdir="${pkgdir}"
	install -Dm644 "${pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
