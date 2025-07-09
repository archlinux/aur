# Maintainer: gfrank227 [at] gmail [dot] com
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: rcf <ryan.farley@gmx.com>
_pkgname=eden
pkgname=$_pkgname-git
pkgver=r27436.64f40c8
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
provides=('eden')
conflicts=('eden')
depends=('enet' 'fmt' 'opus' 'libusb' 'libva' 'qt6-webengine' 'brotli' 'speexdsp' 'hicolor-icon-theme' 'qt6-base' 'zydis' 'sdl2' 'gcc-libs' 'lz4' 'zlib' 'openssl' 'zstd' 'glibc' 'boost-libs' 'libvdpau' 'libx11' 'libdrm')
makedepends=('git' 'cmake' 'wireless_tools' 'spirv-tools' 'nlohmann-json' 'vulkan-headers' 'vulkan-utility-libraries' 'clang' 'llvm' 'gamemode' 'renderdoc' 'lld' 'ninja' 'boost' 'qt6-multimedia' 'qt6-tools' 'nasm' 'opencl-headers' 'doxygen')
optdepends=('gamemode: Gamemoded support')
options=('!debug' 'lto')
source=("git+https://git.eden-emu.dev/eden-emu/eden.git"
		"git+https://github.com/mozilla/cubeb.git"
		"git+https://github.com/yhirose/cpp-httplib.git"
		"git+https://github.com/libsdl-org/SDL.git"
		"git+https://github.com/xiph/opus.git"
		"git+https://github.com/arun11299/cpp-jwt.git"
		"git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
		"git+https://github.com/boostorg/headers.git"
		"git+https://github.com/herumi/xbyak.git"
		"ffmpeg::git+https://github.com/FFmpeg/FFmpeg.git"
		"git+https://github.com/lioncash/biscuit.git" # submodule of dynarmic
		"catch::git+https://github.com/catchorg/Catch2.git" # submodule of dynarmic
		"git+https://github.com/azahar-emu/mcl.git" # submodule of dynarmic
		"git+https://github.com/Tessil/robin-map.git" # submodule of dynarmic
		"git+https://github.com/zyantific/zycore-c.git"  # submodule of dynarmic
		"git+https://github.com/zyantific/zydis.git"  # submodule of dynarmic
		"git+https://github.com/Lizzie841/unordered_dense.git"  # submodule of dynarmic
		"git+https://github.com/KhronosGroup/SPIRV-Headers"  # submodule of sirit 
		"git+https://github.com/eggert/tz.git" # submodule of tzdb_to_nx
		"git+https://github.com/arsenm/sanitizers-cmake.git")  # submdoule of cubeb
		
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
            'SKIP')
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
prepare() {
	cd "$srcdir/$_pkgname"
	for _submodule in opus SDL cubeb VulkanMemoryAllocator cpp-jwt cpp-httplib xbyak ffmpeg;
		do
		git config submodule.$_submodule.url ../$_submodule
		done
	git config submodule.externals/boost-headers.url ../headers

	for _submodule in biscuit catch mcl robin-map zycore zydis unordered_dense;
	do
		git config submodule.externals/dynarmic/externals/$_submodule.url "$srcdir/$_submodule"
	done
	git config submodule.externals/sirit/externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
	git config submodule.externals/nx_tzdb/tzdb_to_nx/externals/tz/tz.url "$srcdir/tz"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$_pkgname/externals/cubeb"
	git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
	git -c protocol.file.allow=always submodule update
}
build() {
	cd "$srcdir"
	cmake -B build -S $_pkgname -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_CXX_COMPILER=clang++ \
    	-DCMAKE_C_COMPILER=clang \
		-DCMAKE_C_FLAGS="$CFLAGS -flto=thin -DNDEBUG" \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS -flto=thin -DNDEBUG" \
		-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld" \
		-DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld" \
    	-DUSE_DISCORD_PRESENCE=ON \
    	-DYUZU_CHECK_SUBMODULES=OFF \
		-DYUZU_ENABLE_LTO=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
		-DYUZU_USE_BUNDLED_FFMPEG=ON \
		-DYUZU_USE_BUNDLED_VCPKG=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_SPIRV_TOOLS=OFF \
		-DYUZU_USE_BUNDLED_SDL2=OFF \
		-DYUZU_USE_EXTERNAL_SDL2=OFF \
		-DYUZU_USE_BUNDLED_QT=OFF \
		-DENABLE_QT_TRANSLATION=ON \
		-DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
		-DYUZU_USE_QT_MULTIMEDIA=ON \
		-DYUZU_USE_QT_WEB_ENGINE=ON \
		-DTITLE_BAR_FORMAT_RUNNING="eden | ${pkgver} {}" \
		-DTITLE_BAR_FORMAT_IDLE="eden ${pkgver} {}" \
		-DLLVM_DIR="/usr/lib/cmake/llvm" \
		-DYUZU_TESTS=OFF
	cmake --build build
}
package() {
	cd "$srcdir"
	DESTDIR="$pkgdir/" cmake --install build
	install -Dm644 "$srcdir/$_pkgname/dist/72-yuzu-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	cd "$srcdir/$_pkgname/LICENSES"
	for file in *.txt;
	do
		install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
	done
}
