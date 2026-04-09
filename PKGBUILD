# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.10.0
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
	wayland
)
provides=(moonshine)
conflicts=(moonshine)
options=(!lto)

source=(
	"https://github.com/hgaiser/moonshine/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('5a23bfd0d80c41a620ec64615a022cf5939dc6040d133b4e964369012b94b458')

build() {
	cd "$srcdir/moonshine-$pkgver"
	cargo build --release --workspace
}

package() {
	cd "$srcdir/moonshine-$pkgver"
	install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 dist/moonshine.service "$pkgdir/usr/lib/systemd/user/moonshine.service"
	install -Dm644 dist/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
	install -Dm755 target/release/libmoonshine_wsi.so "$pkgdir/usr/lib/moonshine/vulkan-layers/libmoonshine_wsi.so"
	install -Dm644 dist/VkLayer_moonshine_wsi.json "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_moonshine_wsi.json"
}
