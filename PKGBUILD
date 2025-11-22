# Maintainer: gfrank227 [at] gmail [dot] com
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: crueter <crueter at crueter dot x y z>
# Contributor: rcf <ryan.farley@gmx.com>
_pkgname=eden
pkgname=$_pkgname-beta
pkgver=0.0.4.rc3
_pkgver=v0.0.4-rc3
pkgrel=2
pkgdesc="Nintendo Switch emulator forked from yuzu - beta and test releases"
arch=('x86_64' 'aarch64')
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
provides=('eden')
conflicts=('eden' 'eden-git' 'eden-bin' 'eden-preview-bin')
depends=('libusb' 'libva' 'qt6-webengine' 'brotli' 'hicolor-icon-theme' 'qt6-base' 'sdl2' 'gcc-libs' 'ffmpeg' 'zydis' 'zycore-c' 'quazip-qt6' 'mbedtls' 'fmt' 'enet' 'cubeb')
makedepends=('git' 'cmake' 'catch2' 'boost' 'cpp-httplib' 'spirv-headers' 'boost-libs' 'wireless_tools' 'vulkan-headers' 'vulkan-utility-libraries' 'nlohmann-json' 'ninja' 'enet' 'gamemode' 'renderdoc' 'qt6-multimedia' 'qt6-tools' 'nasm' 'opencl-headers' 'doxygen' 'cpp-jwt')
optdepends=('gamemode: Gamemoded support')
options=('!lto' '!debug')
source=("git+https://git.eden-emu.dev/eden-emu/eden.git#tag=${_pkgver}")
sha256sums=('72caa50095bcb79a47be60474570958cfc5cb7f732ae537310c4c1d400929c14')
build() {
	cd "$srcdir"
	cmake -B build -S $_pkgname -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DUSE_DISCORD_PRESENCE=ON \
		-DYUZU_ENABLE_LTO=OFF \
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DYUZU_USE_BUNDLED_SDL2=OFF \
		-DYUZU_USE_EXTERNAL_SDL2=OFF \
		-DYUZU_USE_BUNDLED_QT=OFF \
		-DENABLE_QT_TRANSLATION=ON \
		-DYUZU_USE_QT_MULTIMEDIA=ON \
		-DYUZU_USE_QT_WEB_ENGINE=ON \
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
	install -Dm644 "$srcdir/$_pkgname/dist/72-yuzu-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	sed -i 's/KERNEL==/ACTION!="remove", KERNEL==/' "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	cd "$srcdir/$_pkgname/LICENSES"
	for file in *.txt;
	do
		install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
	done
}


