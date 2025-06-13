# Maintainer: gfrank227 [at] gmail [dot] com
# Maintainer: HurricanePooits <hurricanepootis@protonmail.com>
# Contributor: rcf <ryan.farley@gmx.com>
pkgname=eden
pkgver=0.0.2
pkgrel=8
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
depends=('enet' 'fmt' 'ffmpeg' 'opus' 'libusb' 'libva' 'qt6-webengine' 'brotli' 'speexdsp' 'hicolor-icon-theme' 'qt6-base' 'zydis' 'sdl2' 'gcc-libs' 'lz4' 'zlib' 'openssl' 'zstd' 'glibc' 'boost-libs')
makedepends=('git' 'cmake' 'nlohmann-json' 'vulkan-headers' 'vulkan-utility-libraries' 'clang' 'llvm' 'gamemode' 'renderdoc' 'lld' 'ninja' 'boost' 'qt6-multimedia' 'qt6-tools')
optdepends=('gamemode: Gamemoded support')
options=('!debug' '!lto')
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
		"git+https://github.com/lioncash/biscuit.git" # submodule of dynarmic
		"catch::git+https://github.com/catchorg/Catch2.git" # submodule of dynarmic
		"git+https://github.com/azahar-emu/mcl.git"  # submodule of dynarmic
		"git+https://github.com/Tessil/robin-map.git"  # submodule of dynarmic
		"zycore::git+https://github.com/zyantific/zycore-c.git" # submodule of dynarmic
		"git+https://github.com/zyantific/zydis.git" # submodule of dynarmic
		"git+https://github.com/KhronosGroup/SPIRV-Headers"  # submodule of sirit 
		"git+https://github.com/eggert/tz.git"  # submdoule of tzdb_to_nx
		"git+https://github.com/arsenm/sanitizers-cmake") # submodule of cubeb
		
# Note: Submodules not needed to build were excluded: enet, libusb, Vulkan-Headers (used system), libadrenotools, breakpad, oboe, oaknut

sha256sums=('66e5282b7b60624008d44ca17dd7a06cb0fbfa82375e6bf521fb2dea971f2807'
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
            'SKIP'
            'SKIP')

prepare() {
	cd $pkgname
	git cherry-pick -n 15fb1f78b34ac84006069b2eeea9a9b6d612be07		# add fix for boost 1.88 until next release
	for _submodule in opus SDL xbyak cubeb dynarmic simpleini cpp-jwt discord-rpc mbedtls cpp-httplib VulkanMemoryAllocator tzdb_to_nx sirit;
		do
		git config submodule.$_submodule.url "$srcdir/$_submodule"
		done
	git config submodule.externals/boost-headers.url "$srcdir/headers"
	git -c protocol.file.allow=always submodule update

	cd $srcdir/$pkgname/externals/sirit
	git config submodule.externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
	git -c protocol.file.allow=always submodule update

    cd $srcdir/$pkgname/externals/nx_tzdb/tzdb_to_nx
    git config submodule.externals/tz/tz.url "$srcdir/tz"
    git -c protocol.file.allow=always submodule update
    
    cd $srcdir/$pkgname/externals/dynarmic
	for _submodule in biscuit catch mcl robin-map xbyak zycore zydis;
	do
		git config submodule.$_submodule.url "$srcdir/$_submodule"
	done
	git -c protocol.file.allow=always submodule update
    
    cd $srcdir/$pkgname/externals/cubeb
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
		-DUSE_SYSTEM_QT=ON \
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
	mv "$pkgdir/usr/share/applications/org.yuzu_emu.yuzu.desktop" "$pkgdir/usr/share/applications/org.eden_emu.eden.desktop"
	mv "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.yuzu_emu.eden.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.eden_emu.eden.svg"
	mv "$pkgdir/usr/share/metainfo/org.yuzu_emu.yuzu.metainfo.xml" "$pkgdir/usr/share/metainfo/org.eden_emu.eden.metainfo.xml"
	mv "$pkgdir/usr/share/mime/packages/org.yuzu_emu.yuzu.xml" "$pkgdir/usr/share/mime/packages/org.eden_emu.eden.xml"
	sed -i 's/yuzu/eden/g' "$pkgdir/usr/share/mime/packages/org.eden_emu.eden.xml"
}
