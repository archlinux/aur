# Maintainer: tohmais <callum.wishart@protonmail.com>

_pkgname="hyprland"
pkgname="${_pkgname}-nvidia"
pkgver="0.31.0"
pkgrel=2
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (NVIDIA patch)"
arch=(any)
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
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
sha256sums=('863bf5ba1051f223a30efeb0160846784e9b68266d95c7a1c8bac36b19122536')

prepare() {
	cd "$srcdir/hyprland-source"
	sed -E -i -e 's/(soversion = 12)([^032]|$$)/soversion = 12032/g' ./subprojects/wlroots/meson.build
	rm -rf ./subprojects/wlroots/build
	sed -i -e '/^release:/{n;s/-D/-DCMAKE_SKIP_RPATH=ON -D/}' Makefile
	cd "$srcdir/hyprland-source/subprojects/wlroots"
	patch -Np1 <"$srcdir/hyprland-source/nix/patches/wlroots-nvidia.patch"
}

build() {
	# Build wlroots
	cd "$srcdir/hyprland-source/subprojects/wlroots"
	meson build/ --prefix="$srcdir/tmpwlr" --buildtype=release
	ninja -C build/
	mkdir -p "$srcdir/tmpwlr"
	ninja -C build/ install

	# Build udis86
	cd "$srcdir/hyprland-source/subprojects/udis86"
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -G Ninja
	cmake --build build --config Release --target all

	# Build hyprland
	cd "$srcdir/hyprland-source"
	make all
	make -C hyprctl all
}

package() {
	# Install hyprland headers
	cd "$srcdir/hyprland-source"
	find src -name '*.hpp' -exec install -Dm644 {} "$pkgdir/usr/include/hyprland/{}" \;

	# Fix $srcdir reference
	sed -i -e "/ICONDIR/ s,$srcdir/tmpwlr,/usr," "$srcdir/hyprland-source/subprojects/wlroots/build/include/config.h"

	# Install wlroots headers
	cd "$srcdir/hyprland-source/subprojects/wlroots/include"
	find . -name '*.h' -exec install -Dm644 {} "$pkgdir/usr/include/hyprland/wlroots/{}" \;
	cd "$srcdir/hyprland-source/subprojects/wlroots/build/include"
	find . -name '*.h' -exec install -Dm644 {} "$pkgdir/usr/include/hyprland/wlroots/{}" \;

	# Install hyprland
	cd "$srcdir/hyprland-source/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	cd "$srcdir/hyprland-source"
	install -Dm755 -t "$pkgdir/usr/bin" build/Hyprland
	install -Dm755 -t "$pkgdir/usr/bin" hyprctl/hyprctl
	install -Dm644 -t "$pkgdir/usr/include/hyprland/protocols" protocols/*-protocol.h
	install -Dm644 -t "$pkgdir/usr/share/hyprland" assets/*.png
	install -Dm644 -t "$pkgdir/usr/share/hyprland" example/hyprland.conf
	install -Dm644 -t "$pkgdir/usr/share/licenses/hyprland" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/pkgconfig" build/hyprland.pc
	install -Dm644 -t "$pkgdir/usr/share/wayland-sessions" example/hyprland.desktop
	install -Dm755 -t "$pkgdir/usr/lib" "$srcdir/tmpwlr/lib/libwlroots.so.12032"
}
