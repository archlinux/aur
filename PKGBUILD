# Maintainer: Keith Plant <kplantjr at gmail dot com>

pkgname="wlroots-nvidia"
pkgver="0.17.0"
pkgrel="1"
pkgdesc="Modular Wayland compositor library, with fix for nvidia flickering"
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
	'9da3475a6834a6a9a8fd93de84f4ef91f9ee48ff70c305aa9522bf0db9e61128'
	'SKIP'
	'980f4e7c37b30412d2726e5628d41541b76511a36297be7bdd305ba50ed89588'
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
