# Maintainer: gfrank227 [at] gmail [dot] com
# Maintainer: HurricanePooits <hurricanepootis@protonmail.com>
# Contributor: rcf <ryan.farley@gmx.com>
pkgname=eden
pkgver=0.1.1
pkgrel=4
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=('x86_64' 'aarch64')
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
depends=('enet' 'fmt' 'opus' 'lz4' 'zlib' 'zstd' 'libusb' 'openssl' 'glibc'
	 'qt6-webengine' 'brotli' 'hicolor-icon-theme' 'qt6-base' 'sdl2' 'gcc-libs'
	 'ffmpeg' 'boost-libs' 'spirv-tools' 'quazip-qt6' 'mbedtls' 'llvm-libs' 'cubeb')
makedepends=('git' 'cmake' 'catch2' 'boost' 'wireless_tools' 'vulkan-headers' 'vulkan-utility-libraries' 'nlohmann-json' 'ninja' 'gamemode' 'renderdoc' 'qt6-multimedia' 'qt6-tools' 'nasm' 'opencl-headers')
optdepends=('gamemode: Gamemoded support')
conflicts=('eden-bin' 'eden-git' 'eden-preview-bin' 'eden-beta')
options=('!debug')
source=("eden-v${pkgver}.tar.gz::https://git.eden-emu.dev/eden-emu/eden/archive/v${pkgver}.tar.gz"
		"3751.patch"
		"bd6dd7ecec.patch")
sha256sums=('73e3f189fadb71459754d3f53b8c28191c87b267a9923887477804668ff58d08'
            '106a8f2053c6d52951a312b07a09050423362128a7d26344af0bb0f4495fb856'
            '8d441c5152211510d4fdd5ea39f99d4ba3d4b86c7126d352872fd36bfb492d43')
prepare() {
	cd $srcdir/eden
	patch -p1 < $srcdir/3751.patch
	patch -p1 < $srcdir/bd6dd7ecec.patch
}
build() {
	cd "$srcdir"
	cmake -B build -S $pkgname -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DUSE_DISCORD_PRESENCE=ON \
		-DYUZU_ENABLE_LTO=OFF \
		-DYUZU_USE_CPM=OFF \
		-DCPM_USE_LOCAL_PACKAGES=ON \
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
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


