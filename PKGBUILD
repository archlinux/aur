# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-git
pkgver=r611.3f8e17c
pkgrel=1
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
	"${pkgname%-git}::git+https://github.com/hgaiser/moonshine"
)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release --workspace
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 dist/start-moonshine.sh "$pkgdir/usr/bin/start-moonshine.sh"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 dist/moonshine@.service "$pkgdir/usr/lib/systemd/system/moonshine@.service"
	install -Dm644 dist/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
	install -Dm644 dist/moonshine-modules.conf "$pkgdir/usr/lib/modules-load.d/moonshine.conf"
	install -Dm644 dist/50-moonshine-inhibit-sleep.rules "$pkgdir/usr/share/polkit-1/rules.d/50-moonshine-inhibit-sleep.rules"
	install -Dm644 dist/moonshine-sysusers.conf "$pkgdir/usr/lib/sysusers.d/moonshine.conf"
	install -Dm644 dist/VkLayer_moonshine_wsi.json "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_moonshine_wsi.json"
	install -Dm755 target/release/libmoonshine_wsi.so "$pkgdir/usr/lib/moonshine/vulkan-layers/libmoonshine_wsi.so"
}
