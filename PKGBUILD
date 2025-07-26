# Maintainer: Konstantin Rannev <konstantin.rannev@gmail.com>
# Contributor: Ash <xash at riseup d0t net>
# Contributor: PancakeTAS <???>

pkgname=lsfg-vk-git
pkgver=r256.3c77bad
pkgrel=1
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=('x86_64')
url="https://github.com/PancakeTAS/lsfg-vk"
license=('MIT')
depends=(
	'vulkan-icd-loader'
	'bash'
	'gcc-libs'
)
makedepends=(
	'clang'
	'llvm'
	'vulkan-headers'
	'cmake'
	'ninja'
	'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/PancakeTAS/lsfg-vk')
sha256sums=('SKIP')
install=lsfg-vk.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"

	# --filter=tree:0 minimizes network traffic
	git submodule update --init --filter=tree:0 --recursive
}

build() {
	cd "$srcdir/${pkgname%-git}"

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=On
	ninja -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm644 VkLayer_LS_frame_generation.json "$pkgdir/etc/vulkan/implicit_layer.d/VkLayer_LS_frame_generation.json"
	install -Dm644 build/liblsfg-vk.so "$pkgdir/usr/lib/liblsfg-vk.so"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
