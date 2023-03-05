# Maintainer: weitcis <weitcis at pm dot me>
# This PKGBUILD file is modified from
# the hyprland-git and hyprland-hidpi-xprop-git packages made by
# Contributor: ThatOneCalculator <kainoa@t1c.dev>
# Contributor: Aleksana QwQ <me@aleksana.moe>

_pkgname="hyprland"
pkgname="${_pkgname}-legacyrenderer-hidpi-xprop-git"
pkgver=r2557.5184b542
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (Legacy Renderer with HiDPI fix)"
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
	libdisplay-info
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
	cmake
	ninja
	gcc
	gdb
	meson
	vulkan-headers
	wayland-protocols
	xorgproto)
source=("${_pkgname}::git+https://github.com/hyprwm/Hyprland.git"
	"git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "git+https://github.com/hyprwm/hyprland-protocols.git"
	"git+https://github.com/canihavesomecoffee/udis86.git"
        "0001-xwayland-support-HiDPI-scale.patch"
        "0002-Fix-configure_notify-event.patch")
conflicts=("${_pkgname}")
provides=(hyprland)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '304aaf12cbd7dc198bf7e418d729b297ea61186d27c035e4a63a337399fcec76'
            'e7cf16e39db2bde4dbc9d7ec3b4753f7643b1bf198a3179e6802a9c603437fe9')
options=(!makeflags !buildflags !strip)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	rm -rf subprojects/wlroots subprojects/hyprland-protocols
	git config submodule.wlroots.url "${srcdir}"/wlroots
	git config submodule.subprojects/hyprland-protocols.url "${srcdir}"/hyprland-protocols
	git config submodule.subprojects/udis86.url "${srcdir}"/udis86
	git -c protocol.file.allow=always submodule update subprojects/wlroots
	git -c protocol.file.allow=always submodule update subprojects/hyprland-protocols
	git -c protocol.file.allow=always submodule update subprojects/udis86
	cd subprojects/wlroots
	git revert -n 18595000f3a21502fd60bf213122859cc348f9af
	patch -Np1 -i "${srcdir}"/0001-xwayland-support-HiDPI-scale.patch
	patch -Np1 -i "${srcdir}"/0002-Fix-configure_notify-event.patch
}

build() {
	cd "${srcdir}/${_pkgname}"
	make fixwlr
	cd "./subprojects/wlroots/" && meson build/ --prefix="${srcdir}/tmpwlr" --buildtype=release && ninja -C build/ && mkdir -p "${srcdir}/tmpwlr" && ninja -C build/ install && cd ../..
	# the following fix is proposed by @justinesmithies on 2023 Feb 27
	# under the comments of hyprland-git
	cd "./subprojects/udis86" && cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -H./ -B./build -G Ninja && cmake --build ./build --config Release --target all -j$(shell nproc) && cd ../..
	make protocols
	make legacyrenderer
	cd ./hyprctl && make all && cd ..
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/wayland-sessions"
	mkdir -p "${pkgdir}/usr/share/hyprland"
	install -Dm755 build/Hyprland -t "${pkgdir}/usr/bin"
	install -Dm755 hyprctl/hyprctl -t "${pkgdir}/usr/bin"
	install -Dm644 assets/*.png -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 example/hyprland.desktop -t "${pkgdir}/usr/share/wayland-sessions"
	install -Dm644 example/hyprland.conf -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm755 ../tmpwlr/lib/libwlroots.so.12032 -t "${pkgdir}/usr/lib"
}
