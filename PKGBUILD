# Maintainer: Otreblan <otreblain@gmail.com>

# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang
pkgver=2025.15.1
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('MIT')
source=(
	"$url/archive/refs/tags/v$pkgver.tar.gz"
	"lua::git+https://github.com/lua/lua#commit=3fe7be956f23385aa1950dc31e2f25127ccfc0ea"
)
sha256sums=(
	'db81c46c2461f8f1b18df348e30192aa62f029ef708c07a8f80341648f19b7ce'
	'SKIP'
)
makedepends=(
	cmake
	glm
	spirv-headers
	vulkan-headers
)
depends=(
	glslang
	libx11
	llvm
	llvm
	lz4
	miniz
	spirv-tools
	unordered_dense
)

prepare() {
	cd "slang-$pkgver"

	rm -rf external/lua
	ln -s "$srcdir/lua" external/lua

	sed -e "s/find_package(lz4.*/include(FindPkgConfig)\npkg_check_modules(lz4 REQUIRED IMPORTED_TARGET GLOBAL liblz4)/" \
		-e "s/LZ4::lz4/PkgConfig::lz4/g" \
		-i "CMakeLists.txt"

	sed -e "s/\(find_package(LLVM \)\([^ ]\+\) /\1/" \
		-i "cmake/LLVM.cmake"

	sed -e 's/#include "\(SPIRV\/.*\)"/#include <glslang\/\1>/g' \
		-e "/localintermediate.h/d" \
		-i "source/slang-glslang/slang-glslang.cpp"
}

build() {
	cmake -B build -S "slang-$pkgver" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DSLANG_VERSION="v$pkgver" \
		-DSLANG_ENABLE_RELEASE_DEBUG_INFO=FALSE \
		-DSLANG_ENABLE_SPLIT_DEBUG_INFO=FALSE \
		-DSLANG_ENABLE_TESTS=FALSE \
		-DSLANG_ENABLE_SLANG_RHI=FALSE \
		-DSLANG_USE_SYSTEM_MINIZ=TRUE \
		-DSLANG_USE_SYSTEM_LZ4=TRUE \
		-DSLANG_USE_SYSTEM_VULKAN_HEADERS=TRUE \
		-DSLANG_USE_SYSTEM_SPIRV_HEADERS=TRUE \
		-DSLANG_USE_SYSTEM_SPIRV_TOOLS=TRUE \
		-DSLANG_USE_SYSTEM_UNORDERED_DENSE=TRUE \
		-DSLANG_USE_SYSTEM_GLSLANG=TRUE \
		-DSLANG_SLANG_LLVM_FLAVOR=DISABLE \

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
