# Maintainer: Otreblan <otreblain@gmail.com>

# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang
pkgver=2025.17
pkgrel=2
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('Apache-2.0')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname-8369.patch::https://github.com/shader-slang/slang/pull/8369.patch?full_index=2"
	"lua::git+https://github.com/lua/lua#commit=3fe7be956f23385aa1950dc31e2f25127ccfc0ea"
)
sha256sums=('5f654086d5b99bb1fda3f741bbab7e7e7c9da96db2c680ebdf68a91cae247cb4'
            'c864d213419040ba694bb88013e67206ec8d380034ad1ba5eaa7c9a20c94b1d1'
            '265ad53dcb67390ce21acb8165841439ca7bdd1e09a000a6c4e4d38b3a40a598')
makedepends=(
	cmake
	glm
	python3
	spirv-headers
	stb
	unordered_dense
	vulkan-headers
)
depends=(
	glslang
	libx11
	llvm
	lz4
	miniz
	spirv-tools
)

prepare() {
	cd "slang-$pkgver"

	sed -e "s/find_package(lz4.*/include(FindPkgConfig)\npkg_check_modules(lz4 REQUIRED IMPORTED_TARGET GLOBAL liblz4)/" \
		-e "s/LZ4::lz4/PkgConfig::lz4/g" \
		-e "/find_package/ s/VulkanHeaders/Vulkan/g" \
		-i CMakeLists.txt

	sed -e "s/\(find_package(LLVM \)\([^ ]\+\) /\1/" \
		-i cmake/LLVM.cmake

	find tools/gfx/vulkan/ \
		\( -name "*.cpp" -or -name "*.h" \) \
		-exec \
			sed -e 's/"spirv-tools\/include\/\(.*\)"/<\1>/g' \
			-i {} \+

	#TODO https://github.com/shader-slang/slang/issues/8334

	# Change libslang.so -> libshader-slang.so
	sed -e "s/LINK_WITH_PRIVATE slang-common-objects/&\nOUTPUT_NAME $pkgname/g" \
		-i source/slang/CMakeLists.txt

	# Add include prefix
	sed -e 's/${CMAKE_INSTALL_INCLUDEDIR}/&\/'"$pkgname"'/g' \
		-i cmake/SlangTarget.cmake

	# Disable double header install
	perl -0777 -pi -e 's/install\s*\(\s*DIRECTORY\s*"\$\{slang_SOURCE_DIR\}\/include\".*?\)\s*//s' \
		CMakeLists.txt

	# Ignore first hunk
	patch -Np1 -i "$srcdir/$pkgname-8369.patch"

	# https://github.com/shader-slang/slang/pull/8369#issuecomment-3255737218
	sed -e 's/#include "\(SPIRV\/.*\)"/#include <glslang\/\1>/g' \
		-i source/slang-glslang/slang-glslang.cpp

	# Use system stb
	sed -e 's#${CMAKE_CURRENT_LIST_DIR}/stb#/usr/include/stb#' \
		-i external/CMakeLists.txt
}

build() {
	cmake -B build -S "slang-$pkgver" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DSLANG_VERSION_NUMERIC="$pkgver" \
		-DSLANG_VERSION_FULL="v$pkgver" \
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
		-DSLANG_OVERRIDE_LUA_PATH="$srcdir" \
		-DSLANG_SLANG_LLVM_FLAVOR=DISABLE \
		-DSLANG_ENABLE_GFX=FALSE

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
