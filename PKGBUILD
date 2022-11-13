# Maintainer: Keith Plant <kplantjr at gmail dot com>

pkgname="wlroots-nvidia"
pkgver="0.15.1"
pkgrel="2"
pkgdesc="Modular Wayland compositor library, with fix for nvidia flickering"
license=("MIT")

wl_pkgname="wlroots"

url="https://gitlab.freedesktop.org/wlroots/wlroots"
arch=("x86_64")
provides=(
	"wlroots"
	"libwlroots.so"
)
conflicts=(
	"wlroots"
	"wlroots-git"
)
depends=(
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
optdepends=(
	'xorg-xwayland: Xwayland support'
)
source=(
	"$wl_pkgname-$pkgver.tar.gz::https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz"
	"https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz.sig"
	"nvidia.patch"
)
sha256sums=(
	'5b92f11a52d978919ed1306e0d54c9d59f1762b28d44f0a2da3ef3b351305373'
	'SKIP'
	'1d12d28e2dad7faaecb5f995144789b051c0e980917e6d90a9cd44501067379f'
)
validpgpkeys=(
	'34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48' # Simon Ser
	'9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A' # Drew DeVault
	'4100929B33EEB0FD1DB852797BC79407090047CA' # Sway signing key
)

prepare() {
	patch --directory="$wl_pkgname-$pkgver" --forward --strip=0 \
		--input="$srcdir/nvidia.patch"
}

build() {
	arch-meson "$wl_pkgname-$pkgver" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 "$wl_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$wl_pkgname/"
}
