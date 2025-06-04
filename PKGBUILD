# Maintainer: gfrank227 [at] gmail [dot] com
# Contributor: rcf <ryan.farley@gmx.com>
_pkgname=eden
pkgname=$_pkgname-git
pkgver=r27340.6397bb0809
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://eden-emulator.github.io/
license=('GPL-3.0')
provides=('eden')
depends=('qt6-base' 'qt6-webengine' 'clang' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'ffmpeg' 'sdl2-compat' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb' 'enet' 'opus' 'boost')
makedepends=('curl' 'yasm' 'git' 'sdl2' 'cubeb' 'vulkan-headers' 'vulkan-utility-libraries' 'gcc' 'cmake' 'clang' 'llvm' 'doxygen' 'python-pip' 'glslang' 'zip' 'unzip' 'boost' 'catch2' 'mbedtls' 'glslang' 'libzip' 'lz4' 'fmt' 'zip' 'unzip' 'nlohmann-json' 'openssl' 'opus' 'zlib' 'zstd')
conflicts=('eden' 'eden-bin')
options=('!debug' 'lto')
source=("git+https://git.eden-emu.dev/eden-emu/eden.git"
		"git+https://git.eden-emu.dev/eden-emu/cubeb.git"
		"git+https://git.eden-emu.dev/eden-emu/dynarmic.git"
		"git+https://git.eden-emu.dev/eden-emu/discord-rpc.git"
		"sirit::git+https://git.eden-emu.dev/eden-emu/sirit.git"
		"git+https://git.eden-emu.dev/eden-emu/mbedtls.git"
		"git+https://github.com/yhirose/cpp-httplib.git"
		"git+https://github.com/libsdl-org/SDL.git"
		"git+https://github.com/xiph/opus.git"
		"git+https://github.com/arun11299/cpp-jwt.git"
		"git+https://git.eden-emu.dev/eden-emu/tzdb_to_nx.git"
		"git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
		"git+https://git.eden-emu.dev/eden-emu/simpleini.git"
		"git+https://github.com/boostorg/headers.git"
		"git+https://github.com/herumi/xbyak.git"
		"ffmpeg::git+https://github.com/FFmpeg/FFmpeg.git"
		"git+https://github.com/zyantific/zycore-c.git"  # submodule of dynarmic
		"git+https://github.com/zyantific/zydis.git"  # submodule of dynarmic
		"git+https://github.com/Lizzie841/unordered_dense.git"  # submodule of dynarmic
		"git+https://github.com/KhronosGroup/SPIRV-Headers"  # submodule of sirit 
		"git+https://github.com/eggert/tz.git")  # submdoule of tzdb_to_nx
		
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd $_pkgname
	for _submodule in opus SDL cubeb dynarmic discord-rpc simpleini VulkanMemoryAllocator tzdb_to_nx cpp-jwt cpp-httplib xbyak mbedtls sirit ffmpeg;
		do
		git config submodule.$_submodule.url ../$_submodule
		done
	git config submodule.externals/boost-headers.url ../headers
	git config submodule.externals/sirit/externals/SPIRV-Headers.url ../SPIRV-Headers
	git config submodule.externals/nx_tzdb/tzdb_to_nx/externals/tz/tz.url ../tz
	git config submodule.externals/dynarmic/externals/unordered_dense.url ../unordered_dense
	git config submodule.externals/dynarmic/externals/zycore-c.url ../zycore-c
	git config submodule.externals/dynarmic/externals/zydis.url ../zydis
	git -c protocol.file.allow=always submodule update
}
build() {
	cd $srcdir/$_pkgname
	cmake -B Build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_CXX_COMPILER=clang++ \
    	-DCMAKE_C_COMPILER=clang \
    	-DUSE_DISCORD_PRESENCE=ON \
    	-DYUZU_CHECK_SUBMODULES=OFF \
		-DYUZU_ENABLE_LTO=ON \
		-DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
		-DYUZU_USE_BUNDLED_FFMPEG=ON \
		-DYUZU_USE_BUNDLED_VCPKG=OFF \
		-DYUZU_TESTS=OFF
	cmake --build Build
}
package() {
	DESTDIR="$pkgdir/" cmake --install $srcdir/$_pkgname/Build
}
