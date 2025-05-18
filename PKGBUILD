# Maintainer: gfrank227 [at] gmail [dot] com
# Contributor: rcf <ryan.farley@gmx.com>
pkgname=eden
pkgver=0.0.2
pkgrel=7
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://eden-emulator.github.io/
license=('GPL-3.0')
provides=('eden')
depends=('qt6-base' 'qt6-webengine' 'clang' 'qt6-multimedia' 'boost' 'qt6-wayland' 'qt6-tools' 'ffmpeg' 'sdl2-compat' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb' 'enet' 'opus')
makedepends=('curl' 'git' 'sdl2' 'vulkan-headers' 'vulkan-utility-libraries' 'gcc' 'cmake' 'clang' 'llvm' 'doxygen' 'python-pip' 'glslang' 'zip' 'unzip' 'catch2' 'mbedtls' 'glslang' 'libzip' 'lz4' 'fmt' 'zip' 'unzip' 'nlohmann-json' 'openssl' 'opus' 'zlib' 'zstd')
conflicts=('eden-git' 'eden-bin')
options=('!debug')
source=("git+https://git.eden-emu.dev/eden-emu/eden#tag=$pkgver-pre-alpha"
    	"git+https://git.eden-emu.dev/eden-emu/cubeb.git"
		"git+https://git.eden-emu.dev/eden-emu/dynarmic.git"
		"git+https://git.eden-emu.dev/eden-emu/discord-rpc.git"
		"sirit::git+https://git.eden-emu.dev/eden-emu/sirit.git"
		"git+https://git.eden-emu.dev/eden-emu/mbedtls.git"
		"git+https://git.eden-emu.dev/eden-emu/cpp-httplib.git"
		"git+https://git.eden-emu.dev/eden-emu/SDL.git"
		"git+https://git.eden-emu.dev/eden-emu/opus.git"
		"git+https://git.eden-emu.dev/eden-emu/cpp-jwt.git"
		"git+https://git.eden-emu.dev/eden-emu/tzdb_to_nx.git"
		"git+https://git.eden-emu.dev/eden-emu/VulkanMemoryAllocator.git"
		"git+https://git.eden-emu.dev/eden-emu/simpleini.git"
		"git+https://git.eden-emu.dev/eden-emu/headers.git"
		"git+https://git.eden-emu.dev/eden-emu/xbyak.git"
		"git+https://git.eden-emu.dev/eden-emu/mcl.git"  # submodule of dynarmic
		"git+https://git.eden-emu.dev/eden-emu/robin-map.git"  # submodule of dynarmic
		"zycore::git+https://git.eden-emu.dev/eden-emu/zycore-c.git"  # submodule of dynarmic
		"git+https://git.eden-emu.dev/eden-emu/zydis.git"  # submodule of dynarmic
		"git+https://github.com/KhronosGroup/SPIRV-Headers"  # submodule of sirit 
		"git+https://github.com/eggert/tz.git"  # submdoule of tzdb_to_nx
		"git+https://github.com/arsenm/sanitizers-cmake" # submodule of cubeb
		"boost-188.patch")
		
# Note: Submodules not needed to build were excluded: enet, libusb, Vulkan-Headers (used system), libadrenotools, breakpad, oboe, oaknut

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
            'SKIP'
            'SKIP'
            '704a7db84034300f2c4af92a16dc3f167b8f34eb4a8db285e120f679d17028e8')
prepare() {
	cd $pkgname
	patch -Np1 -i ../boost-188.patch
	for _submodule in opus SDL xbyak cubeb dynarmic simpleini cpp-jwt discord-rpc mbedtls cpp-httplib VulkanMemoryAllocator tzdb_to_nx sirit;
		do
		git config submodule.$_submodule.url ../$_submodule
		done
	git config submodule.externals/boost-headers.url ../headers
	git -c protocol.file.allow=always submodule update

	cd $srcdir/$pkgname/externals/sirit
	git config submodule.externals/SPIRV-Headers.url ../../../SPIRV-Headers
	git -c protocol.file.allow=always submodule update

    cd $srcdir/$pkgname/externals/nx_tzdb/tzdb_to_nx
    git config submodule.externals/tz/tz.url ../../../../tz
    git -c protocol.file.allow=always submodule update
    
    cd $srcdir/$pkgname/externals/dynarmic
    git config submodule.zydis.url ../../../zydis
    git config submodule.mcl.url ../../../mcl
    git config submodule.robin-map.url ../../../robin-map
    git config submodule.zycore.url ../../../zycore
    git -c protocol.file.allow=always submodule update
    
    cd $srcdir/$pkgname/externals/cubeb
    git config submodule.cmake/sanitizers-cmake.url ../../../sanitizers-cmake
    git -c protocol.file.allow=always submodule update
}
build() {
	cd $srcdir/eden
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
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DYUZU_USE_BUNDLED_VCPKG=OFF \
		-DYUZU_TESTS=OFF
	cmake --build Build
}
package() {
	DESTDIR="$pkgdir/" cmake --install $srcdir/eden/Build
}
