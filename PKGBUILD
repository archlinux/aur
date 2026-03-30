# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.9.0
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
sha256sums=('f3c9ce3640bc8002878dd3b041fb8c479a0957119fbd976d3b0623329dd7526c')

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
