# Maintainer: Otreblan <otreblain@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=fdtd-vulkan-git
pkgver=r245.54b625b
pkgrel=1
epoch=
pkgdesc="A C++26 vulkan based gui for fdtd"
arch=('x86_64')
url="https://github.com/fdtd-lucuma/fdtd-vulkan"
license=('GPL-3.0-or-later')
groups=()
depends=(
	'gcc-libs'
	'glfw'
	'libxrandr'
	'vulkan-icd-loader'
	'yaml-cpp'
)
makedepends=(
	'bash-completion'
	'clang'
	'cmake'
	'entt'
	'git'
	'glm'
	'llvm'
	'ninja'
	'shader-slang'
	'vulkan-headers'
	'vulkan-memory-allocator'
	'vulkan-validation-layers'
)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"$pkgname::git+$url"
	"imgui-git::git+https://github.com/ocornut/imgui#branch=docking"
	"imgui-module-git::git+https://github.com/stripe2933/imgui-module#branch=docking"
	"vma-hpp-git::git+https://github.com/YaaZ/VulkanMemoryAllocator-Hpp#tag=v3.2.1"
	"vkfw-git::git+https://github.com/Cvelth/vkfw#branch=main"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cmake -G Ninja -B build -S "$pkgname" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DCMAKE_UNITY_BUILD=ON \
		-DUSE_SYSTEM_LIBS=ON \
		-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
		-DFETCHCONTENT_SOURCE_DIR_IMGUI="$srcdir/imgui-git" \
		-DFETCHCONTENT_SOURCE_DIR_IMGUI-MODULE="$srcdir/imgui-module-git" \
		-DFETCHCONTENT_SOURCE_DIR_VULKANMEMORYALLOCATOR-HPP="$srcdir/vma-hpp-git" \
		-DFETCHCONTENT_SOURCE_DIR_VKFW="$srcdir/vkfw-git"

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
