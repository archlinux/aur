# Maintainer: gfrank227 [at] gmail [dot] com
# Maintainer: HurricanePooits <hurricanepootis@protonmail.com>
# Contributor: rcf <ryan.farley@gmx.com>
pkgname=eden
pkgver=0.0.3
pkgrel=2
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
depends=('enet' 'fmt' 'ffmpeg' 'opus' 'libusb' 'libva' 'qt6-webengine' 'brotli' 'speexdsp' 'hicolor-icon-theme' 'qt6-base' 'zydis' 'sdl2' 'gcc-libs' 'lz4' 'zlib' 'openssl' 'zstd' 'glibc' 'quazip-qt6' 'llvm-libs' 'boost-libs')
makedepends=('git' 'cmake' 'nlohmann-json' 'vulkan-headers' 'vulkan-utility-libraries' 'clang' 'llvm' 'gamemode' 'renderdoc' 'lld' 'ninja' 'qt6-multimedia' 'qt6-tools' 'spirv-headers' 'doxygen' 'stb' 'boost' 'rapidjson')
optdepends=('gamemode: Gamemoded support')
options=('!debug' '!lto')
source=("git+https://git.eden-emu.dev/eden-emu/eden#tag=v$pkgver-rc2"
	"git+https://github.com/mozilla/cubeb.git"
	"git+https://github.com/Lizzie841/xbyak.git"
	"git+https://github.com/xiph/opus.git"
	"git+https://github.com/libsdl-org/SDL.git"
	"git+https://github.com/yhirose/cpp-httplib.git"
	"git+https://github.com/arun11299/cpp-jwt.git"
	"git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	"boost-headers::git+https://github.com/boostorg/headers.git"
	"catch::git+https://github.com/catchorg/Catch2.git"
	"git+https://github.com/fmtlib/fmt.git"
	"git+https://github.com/Lizzie841/unordered_dense.git"
	"git+https://github.com/zyantific/zycore-c.git"
	"git+https://github.com/zyantific/zydis.git"
	"git+https://github.com/eggert/tz.git"
	"git+https://github.com/KhronosGroup/SPIRV-Tools.git"
	# Cubeb submodules
	"git+https://github.com/arsenm/sanitizers-cmake.git"
	# Sirit submodule
	"git+https://github.com/KhronosGroup/SPIRV-Headers.git"
)

# Note: Submodules not needed to build were excluded: enet, libusb, Vulkan-Headers (used system), libadrenotools, breakpad, oboe, oaknut

sha256sums=('002ec37061a35d93a8e75e3e86ca53643041f2b8c545eb9dcd061acec88a88db'
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

prepare() {
	cd $pkgname
	#git cherry-pick -n 15fb1f78b34ac84006069b2eeea9a9b6d612be07		# add fix for boost 1.88 until next release
	for _submodule in cubeb xbyak opus SDL cpp-httplib cpp-jwt VulkanMemoryAllocator 
		do
		git config submodule.$_submodule.url "$srcdir/$_submodule"
	done
	for _submodule in SPIRV-Tools boost-headers
	do
		git config submodule.externals/$_submodule.url "$srcdir/$_submodule"
	done
	for _submodule in catch fmt unordered_dense xbyak zycore-c zydis
	do
		git config submodule.externals/dynarmic/externals/$_submodule.url "$srcdir/$_submodule"
	done
	git config submodule.externals/nx_tzdb/tzdb_to_nx/externals/tz/tz.url "$srcdir/tz"
	git config submodule.externals/sirit/externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/externals/cubeb"
	git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
	git -c protocol.file.allow=always submodule update
}
build() {
	cd "$srcdir"
	cmake -B build -S ${pkgname} -GNinja\
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_CXX_COMPILER=clang++ \
    	-DCMAKE_C_COMPILER=clang \
		-DCMAKE_C_FLAGS="$CFLAGS -flto=thin" \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS -flto=thin" \
		-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld" \
		-DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld" \
    	-DUSE_DISCORD_PRESENCE=ON \
    	-DYUZU_CHECK_SUBMODULES=OFF \
		-DYUZU_ENABLE_LTO=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DYUZU_USE_BUNDLED_VCPKG=OFF \
		-DYUZU_USE_BUNDLED_SDL2=OFF \
		-DYUZU_USE_EXTERNAL_SDL2=OFF \
		-DYUZU_USE_BUNDLED_QT=OFF \
		-DENABLE_QT_TRANSLATION=ON \
		-DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
		-DYUZU_USE_QT_MULTIMEDIA=ON \
		-DYUZU_USE_QT_WEB_ENGINE=ON \
		-DTITLE_BAR_FORMAT_RUNNING="eden | ${pkgver} {}" \
		-DTITLE_BAR_FORMAT_IDLE="eden | ${pkgver} {}" \
		-DLLVM_DIR="/usr/lib/cmake/llvm" \
		-DYUZU_TESTS=OFF
	cmake --build build
}
package() {
	cd "$srcdir"
	DESTDIR="$pkgdir/" cmake --install build
	install -Dm644 "$srcdir/$pkgname/dist/72-yuzu-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	cd "$srcdir/$pkgname/LICENSES"
	for file in *.txt;
	do
		install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
	done
}
