# Maintainer: gfrank227 [at] gmail [dot] com
# Maintainer: HurricanePooits <hurricanepootis@protonmail.com>
# Contributor: rcf <ryan.farley@gmx.com>
pkgname=eden
pkgver=0.0.3
pkgrel=4
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
depends=('enet' 'fmt' 'opus' 'quazip-qt6' 'libusb' 'libva' 'qt6-webengine' 'brotli' 'hicolor-icon-theme' 'qt6-base' 'zydis' 'sdl2' 'gcc-libs' 'lz4' 'zlib' 'zstd' 'cubeb' 'spirv-tools' 'ffmpeg')
makedepends=('git' 'cmake' 'mold' 'catch2' 'boost' 'boost-libs' 'wireless_tools' 'vulkan-headers' 'vulkan-utility-libraries' 'nlohmann-json' 'ninja' 'gamemode' 'renderdoc' 'qt6-multimedia' 'qt6-tools' 'nasm' 'opencl-headers')
optdepends=('gamemode: Gamemoded support')
options=('lto' '!debug')
source=("git+https://git.eden-emu.dev/eden-emu/eden.git#tag=v$pkgver-rc3")
sha256sums=('SKIP')
build() {
	cd "$srcdir"
	cmake -B build -S $pkgname -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DYUZU_CHECK_SUBMODULES=OFF \
		-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -fuse-ld=mold" \
		-DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS -fuse-ld=mold" \
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


