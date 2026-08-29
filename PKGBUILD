# Maintainer: PancakeTAS <pancake@mgnet.work>

pkgname=lib32-lsfg-vk-git
_pkgname=lsfg-vk
pkgver=2.0.0.rc1.r5.gfcd3e4b
pkgrel=1
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=('i686' 'x86_64')
url="https://lsfg-vk.dev"
license=('CC-BY-NC-ND-4.0')
depends=(
	'lib32-gcc-libs'
	'lib32-vulkan-icd-loader'
	'lsfg-vk-git'
)
makedepends=(
	'clang'
	'llvm'
	'cmake'
	'ninja'
	'git'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=('git+https://git.lsfg-vk.dev/lsfg-vk.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	tag=$(git describe --tags --abbrev=0)
	commits=$(git rev-list --count "${tag}..HEAD")
	sha=$(git rev-parse --short=7 HEAD)
	printf '%s.r%d.g%s' "${tag//-/.}" "$commits" "$sha"
}

build() {
	cd "$srcdir/$_pkgname"

	cmake -B build -G Ninja \
		-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_CXX_FLAGS=-m32 \
		-DLSFGVK_LAYER_LIBRARY_PATH=liblsfg-vk-layer.x86.so \
		-DLSFGVK_LAYER_MULTILIB_X86=ON \
		-DLSFGVK_BUILD_LAYER=ON \
		-DLSFGVK_BUILD_UI=OFF \
		-DLSFGVK_BUILD_CLI=OFF \
		-DLSFGVK_MANAGED=ON \
		-DLSFGVK_INSTALL_LIBRARIES=OFF
	cmake --build build
}

package() {
	cd "$srcdir/$_pkgname"

	cmake --install build

	install -Dm644 LICENSE.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
