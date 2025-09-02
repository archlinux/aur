# Maintainer: gfrank227 [at] gmail [dot] com
# Maintainer: HurricanePooits <hurricanepootis@protonmail.com>
# Contributor: rcf <ryan.farley@gmx.com>
pkgname=eden
pkgver=0.0.3
pkgrel=8
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=('x86_64' 'aarch64')
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
depends=('enet' 'fmt' 'opus' 'quazip-qt6' 'libusb' 'libva' 'qt6-webengine' 'brotli' 'hicolor-icon-theme' 'qt6-base' 'zydis' 'sdl2' 'gcc-libs' 'lz4' 'zlib' 'zstd' 'cubeb' 'spirv-tools' 'ffmpeg')
makedepends=('git' 'cmake' 'catch2' 'boost' 'boost-libs' 'wireless_tools' 'vulkan-headers' 'vulkan-utility-libraries' 'nlohmann-json' 'ninja' 'gamemode' 'renderdoc' 'qt6-multimedia' 'qt6-tools' 'nasm' 'opencl-headers' 'clang' 'lld')
optdepends=('gamemode: Gamemoded support')
options=('!lto' '!debug')
source=("git+https://git.eden-emu.dev/eden-emu/eden.git#tag=v$pkgver-rc3"
		"xbyak_patch.patch"
		"unordered_dense_patch.patch")
sha256sums=('509a27a7ae5d7b9a9dad18f020e3ace52a97bf3f8fd7a499ddd9ca1be21aee74'
            'c80c77b0d7b829a9627f17945f6078555d2fb7df49142852d13b0542e8e90c3f'
            '1f96277a30507ceb806d2fdb9965b6da3dc3ff5311f1dbb8faab56eab8753afd')
prepare() {
	#update unordered_dense & xbyak repos after dependency repo deletion
	patch $srcdir/eden/src/dynarmic/externals/CMakeLists.txt $srcdir/unordered_dense_patch.patch
	patch $srcdir/eden/externals/CMakeLists.txt $srcdir/xbyak_patch.patch
}
build() {
	cd "$srcdir"
	cmake -B build -S $pkgname -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DYUZU_CHECK_SUBMODULES=OFF \
		-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld" \
		-DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld" \
		-DCMAKE_C_FLAGS="$CFLAGS -flto=thin" \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS -flto=thin" \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DUSE_DISCORD_PRESENCE=ON \
		-DYUZU_ENABLE_LTO=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_SPIRV_TOOLS=OFF \
		-DYUZU_USE_BUNDLED_SDL2=OFF \
		-DYUZU_USE_EXTERNAL_SDL2=OFF \
		-DYUZU_USE_BUNDLED_QT=OFF \
		-DENABLE_QT_TRANSLATION=ON \
		-DYUZU_USE_QT_MULTIMEDIA=ON \
		-DYUZU_USE_QT_WEB_ENGINE=ON \
		-DCMAKE_DISABLE_FIND_PACKAGE_httplib=ON \
		-DTITLE_BAR_FORMAT_RUNNING="eden | ${pkgver} {}" \
		-DTITLE_BAR_FORMAT_IDLE="eden ${pkgver} {}" \
		-DYUZU_TESTS=OFF \
		-DDYNARMIC_TESTS=OFF \
		-DBUILD_TESTING=OFF \
		-Wno-dev
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


