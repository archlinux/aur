# Maintainer: Konstantin Rannev <konstantin.rannev@gmail.com>
# Contributor: Ash <xash at riseup d0t net>

pkgname=lsfg-vk-git
pkgver=r103.223f4ba
pkgrel=2
pkgdesc="Lossless Scaling Frame Generation on Linux via DXVK/Vulkan"
arch=('x86_64')
url="https://github.com/PancakeTAS/lsfg-vk"
license=('MIT')
depends=('vulkan-icd-loader')
makedepends=('clang' 'llvm' 'vulkan-headers' 'cmake' 'meson' 'ninja' 'git' 'sed' 'sdl2' 'glslang')
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

build() {
	cd "$srcdir/${pkgname%-git}"

	cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DCMAKE_CXX_CLANG_TIDY="" \
    -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-z,lazy" # fixes makepkg's default "-z,now" flag which strips out the necessary symbols
    cmake --build build
}

package() {
	cd "$srcdir/${pkgname%-git}"

	DESTDIR="$pkgdir/" cmake --install build --prefix=/usr

	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
