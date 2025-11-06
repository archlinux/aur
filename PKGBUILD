# Maintainer: Otreblan <otreblain@gmail.com>

# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang
pkgver=2025.21.2
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('Apache-2.0')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"lua::git+https://github.com/lua/lua#commit=3fe7be956f23385aa1950dc31e2f25127ccfc0ea"
)
sha256sums=('645942dab2413fe284959cca91e869a6fac4e3ed305855a178ff402c3d4edec6'
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

	# Add include prefix
	sed -e 's/${CMAKE_INSTALL_INCLUDEDIR}/&\/'"$pkgname"'/g' \
		-i cmake/SlangTarget.cmake

	# Disable double header install
	perl -0777 -pi -e 's/install\s*\(\s*DIRECTORY\s*"\$\{slang_SOURCE_DIR\}\/include\".*?\)\s*//s' \
		CMakeLists.txt

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

	# Delete Unix backward compatibility symlink (libslang -> libslang-compiler)
	rm -f "$pkgdir/usr/lib/libslang.so"
}
