# Maintainer: gfrank227 [at] gmail [dot] com
# Contributor: rcf <ryan.farley@gmx.com>
_pkgname=eden
pkgname=$_pkgname-git
pkgver=r27300.a776f5bc3
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://eden-emulator.github.io/
license=('GPL-3.0')
provides=('eden')
depends=('qt6-base' 'qt6-webengine' 'clang' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'ffmpeg' 'sdl2-compat' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb' 'enet' 'opus' 'boost')
makedepends=('curl' 'git' 'sdl2' 'cubeb' 'vulkan-headers' 'vulkan-utility-libraries' 'gcc' 'cmake' 'clang' 'llvm' 'doxygen' 'python-pip' 'glslang' 'zip' 'unzip' 'boost' 'catch2' 'mbedtls' 'glslang' 'libzip' 'lz4' 'fmt' 'zip' 'unzip' 'nlohmann-json' 'openssl' 'opus' 'zlib' 'zstd')
conflicts=('eden' 'eden-bin')
options=('!debug' 'lto')
source=("git+https://git.eden-emu.dev/eden-emu/eden"
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
		"git+https://github.com/Lizzie841/unordered_dense.git"  # submodule of dynarmic
		"git+https://github.com/KhronosGroup/SPIRV-Headers"  # submodule of sirit 
		"git+https://github.com/eggert/tz.git"  # submdoule of tzdb_to_nx
		"boost-188.patch")
		
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
pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd $_pkgname
	patch -Np1 -i ../boost-188.patch
	for _submodule in opus SDL cubeb dynarmic discord-rpc simpleini VulkanMemoryAllocator tzdb_to_nx cpp-jwt cpp-httplib xbyak mbedtls sirit;
		do
		git config submodule.$_submodule.url ../$_submodule
		done
	git config submodule.externals/boost-headers.url ../headers
	git -c protocol.file.allow=always submodule update

	cd $srcdir/$_pkgname/externals/sirit
	git config submodule.externals/SPIRV-Headers.url ../../../SPIRV-Headers
	git -c protocol.file.allow=always submodule update

    cd $srcdir/$_pkgname/externals/nx_tzdb/tzdb_to_nx
    git config submodule.externals/tz/tz.url ../../../../tz
    git -c protocol.file.allow=always submodule update
    
    cd $srcdir/$_pkgname/externals/dynarmic
    for _submodule in zydis mcl robin-map zycore unordered_dense;
		do
		git config submodule.$_submodule.url ../../../$_submodule
		done
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
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DYUZU_USE_BUNDLED_VCPKG=OFF \
		-DYUZU_TESTS=OFF
	cmake --build Build
}
package() {
	DESTDIR="$pkgdir/" cmake --install $srcdir/$_pkgname/Build
}
