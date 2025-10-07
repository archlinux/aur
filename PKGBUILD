# Maintainer: gfrank227 [at] gmail [dot] com
# Maintainer: HurricanePooits <hurricanepootis@protonmail.com>
# Contributor: rcf <ryan.farley@gmx.com>
pkgname=eden
pkgver=0.0.3
pkgrel=14
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=('x86_64' 'aarch64')
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
depends=('enet' 'fmt' 'opus' 'quazip-qt6' 'zydis' 'lz4' 'zlib' 'zstd' 'spirv-tools' 'cubeb' 'libusb'
	'libva' 'qt6-webengine' 'brotli' 'hicolor-icon-theme' 'qt6-base' 'sdl2' 'gcc-libs' 'ffmpeg')
makedepends=('git' 'cmake' 'catch2' 'boost' 'boost-libs' 'wireless_tools' 'vulkan-headers' 'vulkan-utility-libraries' 'nlohmann-json' 'ninja' 'gamemode' 'renderdoc' 'qt6-multimedia' 'qt6-tools' 'nasm' 'opencl-headers')
optdepends=('gamemode: Gamemoded support')
options=('!debug')
source=("https://git.eden-emu.dev/eden-emu/eden/archive/v${pkgver}.tar.gz")
sha256sums=('5e97058e43b0c8780caba7f549f5fdf50a08cfbb478289c86e0dd7c2d1c27aaa')
build() {
	cd "$srcdir"
	cmake -B build -S $pkgname -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DYUZU_CHECK_SUBMODULES=OFF \
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
		-Dhttplib_FORCE_BUNDLED=ON \
		-DTITLE_BAR_FORMAT_RUNNING="eden | ${pkgver} {}" \
		-DTITLE_BAR_FORMAT_IDLE="eden ${pkgver} {}" \
		-DYUZU_TESTS=OFF \
		-DDYNARMIC_TESTS=OFF \
		-DBUILD_TESTING=OFF \
		-DYUZU_USE_FASTER_LD=OFF \
		-Wno-dev
	cmake --build build
}
package() {
	cd "$srcdir"
	DESTDIR="$pkgdir/" cmake --install build
	install -Dm644 "$srcdir/$pkgname/dist/72-yuzu-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	sed -i 's/KERNEL==/ACTION!="remove", KERNEL==/' "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules" # systemd 258 fix
	cd "$srcdir/$pkgname/LICENSES"
	for file in *.txt;
	do
		install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
	done
}


