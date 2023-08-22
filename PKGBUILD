# Maintainer: Integral <integral@murena.io>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: q234 rty <q23456yuiop at gmail dot com>
# Contributor: ThatOneCalculator <kainoa@t1c.dev>
# Contributor: lilydjwg <lilydjwg@gmail.com>

_pkgname="hyprland"
pkgname="${_pkgname}-nvidia-hidpi-git"
pkgver=0.28.0.r83.5e7183da
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (NVIDIA + HiDPI patch)"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64" "riscv64")
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
	xorg-xwayland-hidpi-xprop
	libdisplay-info.so)
makedepends=(
	git
	cmake
	ninja
	gcc
	meson
	vulkan-headers
	wayland-protocols
	xorgproto)
source=("${_pkgname}::git+https://github.com/hyprwm/Hyprland.git"
	"git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
	"git+https://github.com/hyprwm/hyprland-protocols.git"
	"git+https://github.com/canihavesomecoffee/udis86.git"
	"0001-xwayland-support-HiDPI-scale.patch"
	"0002-Fix-configure_notify-event.patch"
	"0003-Fix-size-hints-under-Xwayland-scaling.patch"
	"nvidia.patch")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
sha256sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'2fd861a76fb7a6b0bba12e7d307ad655e40ec93a84c88dfc00571aac6e119e85'
	'1314d0ee63a4249698791d86cce5e6cdb4f005b81bbb1c6a747578d2a9223795'
	'c08dd62a1786eeb7506f1839bfcbba791502360392c929e620244f70c8ca5b61'
	'c200d341641ee20a13b1893e27a9d823e9ef5ac2378e3cdecd0efc55a713db1c')
options=(debug)

pkgver() {
	git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	rm -rf subprojects/wlroots subprojects/hyprland-protocols
	git submodule init
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
	patch -Np1 -i "${srcdir}"/0003-Fix-size-hints-under-Xwayland-scaling.patch
	patch --forward --strip=0 --input="${srcdir}"/nvidia.patch
	cd "${srcdir}/${_pkgname}"
	make fixwlr
}

build() {
	cd "${srcdir}/${_pkgname}"
	cd "./subprojects/wlroots/" && meson setup build/ --prefix="${srcdir}/tmpwlr" --buildtype=plain && ninja -C build/ && mkdir -p "${srcdir}/tmpwlr" && ninja -C build/ install && cd ../..
	cd "./subprojects/udis86/" && cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=None -H./ -B./build -G Ninja && cmake --build ./build --target all && cd ../..
	mkdir -p build && cd build
	cmake -G Ninja -DCMAKE_BUILD_TYPE=None -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=/usr ..
	ninja
	cd "${srcdir}/${_pkgname}"
	cd ./hyprctl && make all && cd ..
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 build/Hyprland -t "${pkgdir}/usr/bin"
	install -Dm755 hyprctl/hyprctl -t "${pkgdir}/usr/bin"
	install -Dm644 assets/*.png -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 example/hyprland.desktop -t "${pkgdir}/usr/share/wayland-sessions"
	install -Dm644 example/hyprland.conf -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 subprojects/wlroots/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-wlroots"
	install -Dm644 subprojects/udis86/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-udis86"
	install -Dm644 docs/*.1 -t "${pkgdir}/usr/share/man/man1"
	install -Dm755 ../tmpwlr/lib/libwlroots.so.* -t "${pkgdir}/usr/lib"
	install -d "${pkgdir}/usr/include/hyprland/protocols"
	install -d "${pkgdir}/usr/include/hyprland/wlroots"
	cp -R src ${pkgdir}/usr/include/hyprland/
	cp -R ../tmpwlr/include/* ${pkgdir}/usr/include/hyprland/wlroots/
	find ${pkgdir}/usr/include/hyprland/ -type f ! -name '*.h*' -delete
	cp protocols/*-protocol.h ${pkgdir}/usr/include/hyprland/protocols
	install -Dm644 build/hyprland.pc -t "${pkgdir}/usr/share/pkgconfig"
}
