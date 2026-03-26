# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.8.1
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
makedepends=(clang cmake libc++ rust)
depends=(
	avahi
	gcc-libs
	glibc
	libevdev
	libxkbcommon
	mesa
	opus
	shaderc
)
provides=(moonshine)
conflicts=(moonshine)
options=(!lto)

source=(
	"https://github.com/hgaiser/moonshine/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('ca43160ad7796c5341d117f727ca1f5e519c0c11171e01880a51781030079de0')

build() {
	cd "$srcdir/moonshine-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/moonshine-$pkgver"
	install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 dist/moonshine.service "$pkgdir/usr/lib/systemd/user/moonshine.service"
	install -Dm644 dist/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
	install -Dm755 dist/vulkan-layers/libVkLayer_FROG_gamescope_wsi_x86_64.so "$pkgdir/usr/lib/moonshine/vulkan-layers/libVkLayer_FROG_gamescope_wsi_x86_64.so"
	install -Dm644 dist/vulkan-layers/VkLayer_moonshine_gamescope_wsi.x86_64.json "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_moonshine_gamescope_wsi.x86_64.json"
}
