# Maintainer: Konstantin Rannev <konstantin d0t rannev at gmail d0t com>
# Contributor: Ash <xash at riseup d0t net>
# Contributor: PancakeTAS <???>

pkgname=lsfg-vk-git
pkgver=2.0.0.dev.r15.14904b9
pkgrel=1
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=('x86_64')
url="https://github.com/PancakeTAS/lsfg-vk"
license=('GPL-3.0-or-later')
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
	'vulkan-headers'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/PancakeTAS/lsfg-vk#branch=develop')
sha256sums=('SKIP')
install=lsfg-vk.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# NOTE: this moves the tag to the first commit with 2.0.0-dev
	git tag -d "v2.0.0-dev" 2>/dev/null >/dev/null
	git -c user.name='PancakeTAS' \
		-c user.email='pancake@mgnet.work' \
		tag "v2.0.0-dev" '2a13914b55e7ce71f5522513fde277a2affb5a1f' \
			-m "original 2.0.0-dev tag location" \
		2>/dev/null >/dev/null

	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
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
