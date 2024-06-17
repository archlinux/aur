# Maintainer: raku_cat <raku at raku dot party>
# Based on PKGBUILD from: Keith Plant <kplantjr at gmail dot com>

pkgname="wlroots-nvidia-screenshare"
pkgver="0.17.3"
pkgrel="1"
pkgdesc="Modular Wayland compositor library, with fix for screensharing on Nvidia"
license=("MIT")

wl_pkgname="wlroots"

url="https://gitlab.freedesktop.org/wlroots/wlroots"
arch=("x86_64")
provides=(
	"wlroots=$pkgver"
	"libwlroots.so"
)
conflicts=(
	"wlroots"
	"wlroots-git"
)
depends=(
	'libdisplay-info.so'
	'libglvnd'
	'libinput'
	'libpixman-1.so'
	'libseat.so'
	'libudev.so'
	'libvulkan.so'
	'libwayland-client.so'
	'libwayland-server.so'
	'libxcb'
	'libxkbcommon.so'
	'opengl-driver'
	'xcb-util-errors'
	'xcb-util-renderutil'
	'xcb-util-wm'
)
makedepends=(
	'glslang'
	'meson'
	'ninja'
	'systemd'
	'vulkan-headers'
	'wayland-protocols'
	'xorg-xwayland'
)
options=(
    'debug'
)
optdepends=(
	'xorg-xwayland: Xwayland support'
)
source=(
	"$wl_pkgname-$pkgver.tar.gz::https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz"
	"https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz.sig"
	"wlroots-nvidia-screenshare.patch"
	"libliftoff-fix.patch"
)
sha256sums=('04d31521bd2b737541b9680098e55ebaaf956e68d692f80479f4ee1236606d98'
            'SKIP'
            '857addf4590b876e186f57dc69cc1a2d9915591bf4ff598da01293d0f847c4ec'
            '2c1525dd55356f706132bbbe8fb7a0060931f2ab2bf12a5b182364348bd322af')
validpgpkeys=(
	'34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48' # Simon Ser
	'9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A' # Drew DeVault
	'4100929B33EEB0FD1DB852797BC79407090047CA' # Sway signing key
)

prepare() {
	patch --directory="$wl_pkgname-$pkgver" --forward --strip=0 \
		--input="$srcdir/wlroots-nvidia-screenshare.patch"
    patch --directory="$wl_pkgname-$pkgver" --forward --strip=0 \
        --input="$srcdir/libliftoff-fix.patch"
}

build() {
	arch-meson "$wl_pkgname-$pkgver" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 "$wl_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$wl_pkgname/"
}
