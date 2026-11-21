# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-bin
pkgver=0.19.0
pkgrel=1
_ferriscope_ver=0.2.2
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
depends=(
	expat
	gcc-libs
	glibc
	libdrm
	libevdev
	libffi
	libxkbcommon
	mesa
	opus
	wayland
	xorg-xwayland
)
provides=(moonshine)
conflicts=(moonshine)

source=(
	"https://github.com/hgaiser/moonshine/releases/download/v$pkgver/moonshine-v$pkgver-linux-amd64.tar.zst"
	# Only for the ferriscope license texts; the layer itself is prebuilt.
	"ferriscope-$_ferriscope_ver.tar.gz::https://github.com/hgaiser/ferriscope/archive/refs/tags/v$_ferriscope_ver.tar.gz"
)
sha256sums=('8bbd81e0fe8d93050c88816b9d971a72c6ee0ce3af8b37754354c07d18664fea'
            '8fbfcce2c117e558da8955e32d7d1cba5f21863040e324b36e0dcfabc3dc1ef5')

package() {
	cd "$srcdir/moonshine"

	install -Dm755 bin/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 share/moonshine/start-moonshine.sh "$pkgdir/usr/bin/start-moonshine.sh"
	install -Dm755 bin/moonshine-gamescope "$pkgdir/usr/bin/moonshine-gamescope"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/ferriscope-$_ferriscope_ver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.ferriscope"
	install -Dm644 "$srcdir/ferriscope-$_ferriscope_ver/protocol/ferriscope-swapchain-v1.xml" \
		"$pkgdir/usr/share/licenses/$pkgname/ferriscope-swapchain-v1.xml"
	install -Dm644 share/moonshine/moonshine@.service "$pkgdir/usr/lib/systemd/system/moonshine@.service"
	install -Dm644 share/moonshine/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
	install -Dm755 lib/ferriscope/libferriscope_wsi.so "$pkgdir/usr/lib/ferriscope/libferriscope_wsi.so"
	install -Dm644 share/vulkan/implicit_layer.d/VkLayer_FERRISCOPE_wsi.x86_64.json \
		"$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_FERRISCOPE_wsi.x86_64.json"
	install -Dm644 share/moonshine/moonshine-modules.conf "$pkgdir/usr/lib/modules-load.d/moonshine.conf"

	install -Dm644 share/moonshine/50-moonshine-inhibit-sleep.rules "$pkgdir/usr/share/polkit-1/rules.d/50-moonshine-inhibit-sleep.rules"
	install -Dm644 share/moonshine/moonshine-sysusers.conf "$pkgdir/usr/lib/sysusers.d/moonshine.conf"
}
