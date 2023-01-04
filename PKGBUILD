# Maintainer: Keith Plant <kplantjr at gmail dot com>

pkgname="wlroots-nvidia"
pkgver="0.16.1"
pkgrel="1"
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
	'130a1a86f6f8c4fa162ba4db82aaa70850273c5d01313b242baa0144e3d6d253'
	'SKIP'
	'83cbb8211265fed66b4320e6fd986606731b8f5f04bf6cabe7280e8f5fdba783'
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
