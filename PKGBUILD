# Maintainer: Konstantin Rannev <konstantin.rannev@gmail.com>
# Contributor: Ash <xash at riseup d0t net>
# Contributor: PancakeTAS <???>

pkgname=lsfg-vk-git
pkgver=v2.0.0.dev.r0.2a13914
pkgrel=1
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=('x86_64')
url="https://github.com/PancakeTAS/lsfg-vk"
license=('GPLv3-or-later')
depends=(
	'glibc'
	'gcc-libs'
	'vulkan-icd-loader'
	'libglvnd'
	'qt6-base'
	'qt6-declarative'
)
makedepends=(
	'clang'
	'llvm'
	'cmake'
	'ninja'
	'pkgconf'
	'vulkan-headers'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/PancakeTAS/lsfg-vk#branch=develop')
sha256sums=('SKIP')
install=lsfg-vk.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	cmake -B build -G Ninja \
		-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DLSFGVK_BUILD_VK_LAYER=ON \
		-DLSFGVK_BUILD_UI=ON \
		-DLSFGVK_BUILD_CLI=ON \
		-DLSFGVK_INSTALL_DEVELOP=ON \
		-DLSFGVK_INSTALL_XDG_FILES=ON
	cmake --build build
}

package() {
	cd "$srcdir/${pkgname%-git}"

	cmake --install build

	install -Dm644 LICENSE.md \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
