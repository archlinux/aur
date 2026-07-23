# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.13.5
pkgrel=2
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
makedepends=(clang cmake git libc++ rust)
depends=(
	gcc-libs
	glibc
	libevdev
	libxkbcommon
	mesa
	opus
	wayland
)
provides=(moonshine)
conflicts=(moonshine)
options=(!lto)

source=(
	"https://github.com/hgaiser/moonshine/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('e7518da0921878aaf0c361c9fbbdbc6997d9cc668b8826bafcb3d225e1a8570f')

build() {
	cd "$srcdir/moonshine-$pkgver"
	cargo build --release --workspace
}

package() {
	cd "$srcdir/moonshine-$pkgver"
	install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 dist/start-moonshine.sh "$pkgdir/usr/bin/start-moonshine.sh"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 dist/moonshine@.service "$pkgdir/usr/lib/systemd/system/moonshine@.service"
	install -Dm644 dist/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
	install -Dm644 dist/VkLayer_moonshine_wsi.json "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_moonshine_wsi.json"
	install -Dm755 target/release/libmoonshine_wsi.so "$pkgdir/usr/lib/moonshine/vulkan-layers/libmoonshine_wsi.so"
	install -Dm644 dist/moonshine-modules.conf "$pkgdir/usr/lib/modules-load.d/moonshine.conf"
	install -Dm644 dist/VkLayer_moonshine_wsi.json "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_moonshine_wsi.json"
	install -Dm755 target/release/libmoonshine_wsi.so "$pkgdir/usr/lib/moonshine/vulkan-layers/libmoonshine_wsi.so"
}
