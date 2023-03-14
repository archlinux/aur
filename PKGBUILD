# Maintainer: weitcis <weitcis at pm dot me>
# This PKGBUILD file is modified from
# the hyprland package made by
# Contributor: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="hyprland"
pkgname="${_pkgname}-legacyrenderer"
pkgver="0.23.0beta"
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (Legacy Renderer)"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/Hyprland"
license=('BSD')
depends=(
	libxcb
	xcb-proto
	xcb-util
	xcb-util-keysyms
	libxfixes
	libx11
	libxcomposite
	xorg-xinput
	libxrender
	pixman
	wayland-protocols
	cairo
	pango
	polkit
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
	xorg-xwayland
	libliftoff
	libdisplay-info)
makedepends=(
	git
	cmake
	ninja
	gcc
	gdb
	meson
	vulkan-headers
	wayland-protocols
	xorgproto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hyprwm/Hyprland/releases/download/v${pkgver}/source-v${pkgver}.tar.gz")
sha256sums=('779c35b0256cffe681586e4c34d63cf46fe4f263eff5370d06ae77a96e5de01f')
conflicts=("${_pkgname}")
provides=(hyprland)
options=(!makeflags !buildflags !strip)

build() {
	cd "$srcdir/hyprland-source"
	make fixwlr
	cd "./subprojects/wlroots/" && meson build/ --prefix="${srcdir}/tmpwlr" --buildtype=release && ninja -C build/ && mkdir -p "${srcdir}/tmpwlr" && ninja -C build/ install && cd ../
	# the following fix is proposed by @justinesmithies on 2023 Feb 27
	# under the comments of hyprland-git
	cd udis86 && cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -H./ -B./build -G Ninja && cmake --build ./build --config Release --target all -j$(shell nproc) && cd ../..
	make protocols
	make legacyrenderer
	cd ./hyprctl && make all && cd ..
}

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/usr/share/wayland-sessions"
	mkdir -p "${pkgdir}/usr/share/hyprland"
	install -Dm755 hyprland-source/build/Hyprland -t "${pkgdir}/usr/bin"
	install -Dm755 hyprland-source/hyprctl/hyprctl -t "${pkgdir}/usr/bin"
	install -Dm644 hyprland-source/assets/*.png -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 hyprland-source/example/hyprland.desktop -t "${pkgdir}/usr/share/wayland-sessions"
	install -Dm644 hyprland-source/example/hyprland.conf -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 hyprland-source/LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm755 "${srcdir}/tmpwlr/lib/libwlroots.so.12032" -t "${pkgdir}/usr/lib"
}
