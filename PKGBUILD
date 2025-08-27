# Maintainer: Konstantin Rannev <konstantin.rannev@gmail.com>
# Contributor: Ash <xash at riseup d0t net>
# Contributor: PancakeTAS <???>

pkgname=lsfg-vk-git
pkgver=v1.0.0.r40.5e04b4f
pkgrel=2
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=('x86_64')
url="https://github.com/PancakeTAS/lsfg-vk"
license=('MIT')
depends=(
	'vulkan-icd-loader'
	'bash'
	'gcc-libs'
	'gtk4'
	'libadwaita'
	'pkgconf'
)
makedepends=(
	'clang'
	'llvm'
	'vulkan-headers'
	'cmake'
	'ninja'
	'git'
	'rust'
	'cargo'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/PancakeTAS/lsfg-vk#branch=develop')
sha256sums=('SKIP')
install=lsfg-vk.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, tags available
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	# build library
	cmake -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=On
	ninja -C build

	# build UI
	cd ui
	cargo build --release --locked
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# base library and config
	install -Dm644 VkLayer_LS_frame_generation.json "$pkgdir/etc/vulkan/implicit_layer.d/VkLayer_LS_frame_generation.json"
	install -Dm644 build/liblsfg-vk.so "$pkgdir/usr/lib/liblsfg-vk.so"

	# UI binary, desktop file and icon
	install -Dm755 ui/target/release/lsfg-vk-ui "$pkgdir/usr/bin/lsfg-vk-ui"
	install -Dm644 ui/rsc/gay.pancake.lsfg-vk-ui.desktop "$pkgdir/usr/share/applications/lsfg-vk-ui.desktop"
	install -Dm644 ui/rsc/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/gay.pancake.lsfg-vk-ui.png"

	# license
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
