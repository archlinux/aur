# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
depends=(
	gcc-libs
	glibc
	libdrm
	libevdev
	expat
	libffi
	libxkbcommon
	mesa
	opus
	wayland
)
provides=(moonshine)
conflicts=(moonshine)

source=(
	"https://github.com/hgaiser/moonshine/releases/download/v$pkgver/moonshine-v$pkgver-linux-amd64.tar.zst"
	"https://raw.githubusercontent.com/hgaiser/moonshine/v$pkgver/dist/50-moonshine-inhibit-sleep.rules"
	"https://raw.githubusercontent.com/hgaiser/moonshine/v$pkgver/dist/moonshine-sysusers.conf"
)
# TODO: Remove the two raw GitHub sources below once the next release
# is published — they'll be included in the tarball (fixed in
# moonshine/.github/workflows/release.yaml).
sha256sums=('2b868b3eaa60a1c7f9743308e3907c6aa192c29676b467f6397ce335c071b7dc'
            '66465404a061b767524cbd9f2cd9ea3eda336d4d57a985b775db9fe59ea71612'
            'a01ffbd68e9e78c2904db1b933898fa821875d33ff40fa77f5b24940fe287a4b')

package() {
	cd "$srcdir/moonshine"

	install -Dm755 bin/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 share/moonshine/start-moonshine.sh "$pkgdir/usr/bin/start-moonshine.sh"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 share/moonshine/moonshine@.service "$pkgdir/usr/lib/systemd/system/moonshine@.service"
	install -Dm644 share/moonshine/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
	install -Dm644 share/moonshine/VkLayer_moonshine_wsi.json "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_moonshine_wsi.json"
	install -Dm755 lib/moonshine/vulkan-layers/libmoonshine_wsi.so "$pkgdir/usr/lib/moonshine/vulkan-layers/libmoonshine_wsi.so"
	install -Dm644 share/moonshine/moonshine-modules.conf "$pkgdir/usr/lib/modules-load.d/moonshine.conf"

	install -Dm644 "$srcdir/50-moonshine-inhibit-sleep.rules" "$pkgdir/usr/share/polkit-1/rules.d/50-moonshine-inhibit-sleep.rules"
	install -Dm644 "$srcdir/moonshine-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/moonshine.conf"
}
