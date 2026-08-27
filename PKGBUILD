# Maintainer: Konstantin Rannev <konstantin d0t rannev at gmail d0t com>
# Contributor: Ash <xash at riseup d0t net>
# Contributor: PancakeTAS <???>

pkgname=lsfg-vk-git
pkgver=2.0.0.rc1.r0.gf715073
pkgrel=1
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=('x86_64')
url="https://lsfg-vk.dev"
license=('CC-BY-NC-ND-4.0')
depends=(
	'gcc-libs'
	'vulkan-icd-loader'
	'libglvnd'
	'qt6-base'
	'qt6-declarative'
	'hicolor-icon-theme'
)
makedepends=(
	'clang'
	'llvm'
	'cmake'
	'ninja'
	'git'
	'pkgconf'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=('git+https://git.lsfg-vk.dev/lsfg-vk.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	tag=$(git describe --tags --abbrev=0)
	commits=$(git rev-list --count "${tag}..HEAD")
	sha=$(git rev-parse --short=7 HEAD)
	printf '%s.r%d.g%s' "${tag//-/.}" "$commits" "$sha"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	cmake -B build -G Ninja \
		-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DLSFGVK_BUILD_LAYER=ON \
		-DLSFGVK_BUILD_UI=ON \
		-DLSFGVK_BUILD_CLI=ON \
		-DLSFGVK_MANAGED=ON \
		-DLSFGVK_INSTALL_LIBRARIES=ON
	cmake --build build
}

package() {
	cd "$srcdir/${pkgname%-git}"

	cmake --install build

	install -Dm644 LICENSE.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
