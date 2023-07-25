# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=rpcsx
pkgname=$_pkgname-git
pkgver=r246.ff26305
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator"
arch=('x86_64')
url="https://rpcsx.github.io/rpcsx-site/"
license=('GPL2' 'MIT')
depends=(
	'gcc-libs'
	'glfw>=3.3'
	'glibc'
	'libunwind'
	'spirv-tools'
)
makedepends=(
	'cmake'
	'git'
	'glslang'
	'spirv-cross'
	'vulkan-headers>=1:1.3'
	'vulkan-icd-loader>=1.3'
	'xbyak'
)
optdepends=('vulkan-validation-layers: for rpcsx-gpu')
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/RPCSX/rpcsx.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	sed -i '/xbyak/c find_package(xbyak)' CMakeLists.txt
	sed -i 's/xbyak/xbyak::xbyak/' rpcsx-os/CMakeLists.txt
	sed -i 's/-march=native/-mfsgsbase/' rpcsx-os/CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=('libvulkan.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/orbis-kernel/LICENSE
}
