# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-dolphin
pkgname=$_pkgname-git
pkgver=r44842.df2b1a754b
pkgrel=1
pkgdesc="Nintendo GameCube/Wii core"
arch=('x86_64')
url="https://github.com/libretro/dolphin"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=(
	'enet'
	'gcc-libs'
	'glibc'
	'glslang'
	'libretro-core-info'
	'libx11'
	'libxi'
	'pugixml'
)
makedepends=(
	'bluez-libs'
	'bzip2'
	'cmake'
	'curl'
	'fmt'
	'git'
	'hidapi'
	'libgl'
	'libspng'
	'libsystemd'
	'libusb'
	'lz4'
	'lzo'
	'mbedtls2'
	'minizip-ng'
	'python'
	'sfml'
	'vulkan-headers'
	'xorgproto'
	'xxhash'
	'xz'
	'zlib'
	'zstd'
)
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	"cpp-ipc::git+https://github.com/mutouyun/cpp-ipc.git"
	"cpp-optparse::git+https://github.com/weisslj/cpp-optparse.git"
	"imgui::git+https://github.com/ocornut/imgui.git"
	"implot::git+https://github.com/epezent/implot.git"
	"tinygltf::git+https://github.com/syoyo/tinygltf.git"
	"vulkan-memory-allocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	"watcher::git+https://github.com/e-dant/watcher.git"
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.Externals/cpp-ipc/cpp-ipc.url ../cpp-ipc
	git config submodule.Externals/cpp-optparse/cpp-optparse.url ../cpp-optparse
	git config submodule.Externals/imgui/imgui.url ../imgui
	git config submodule.Externals/implot/implot.url ../implot
	git config submodule.Externals/tinygltf/tinygltf.url ../tinygltf
	git config submodule.Externals/VulkanMemoryAllocator.url ../vulkan-memory-allocator
	git config submodule.Externals/watcher/watcher.url ../watcher
	git -c protocol.file.allow=always submodule update
}

build() {
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D ENABLE_LTO=OFF
		-D LIBRETRO=ON
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

package() {
	depends+=(
		'libbluetooth.so'
		'libbz2.so'
		'libcurl.so'
		'libEGL.so'
		'libfmt.so'
		'libGLX.so'
		'libhidapi-hidraw.so'
		'liblz4.so'
		'liblzma.so'
		'liblzo2.so'
		'libmbedcrypto.so'
		'libmbedtls.so'
		'libmbedx509.so'
		'libsfml-network.so'
		'libspng.so'
		'libusb-1.0.so'
		'libxxhash.so'
		'libz.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/dolphin_libretro.so
}
