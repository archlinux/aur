# Maintainer: gfrank227 [at] gmail [dot] com
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: crueter <crueter at crueter dot x y z>
# Contributor: rcf <ryan.farley@gmx.com>
_pkgname=eden
pkgname=$_pkgname-git
epoch=1
pkgver=0.0.3.rc3.r2.g0e7203d
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
provides=('eden')
conflicts=('eden')
depends=('enet' 'fmt' 'opus' 'quazip-qt6' 'libusb' 'libva' 'qt6-webengine' 'brotli' 'speexdsp' 'hicolor-icon-theme' 'qt6-base' 'zydis' 'sdl2' 'gcc-libs' 'lz4' 'zlib' 'openssl' 'zstd' 'libvdpau' 'libx11' 'libdrm')
makedepends=('git' 'cmake' 'mold' 'catch2' 'boost' 'cubeb' 'boost-libs' 'spirv-tools' 'wireless_tools' 'vulkan-headers' 'vulkan-utility-libraries' 'nlohmann-json' 'ninja' 'gamemode' 'renderdoc' 'qt6-multimedia' 'qt6-tools' 'nasm' 'opencl-headers')
optdepends=('gamemode: Gamemoded support')
options=('lto' '!debug')
source=("git+https://git.eden-emu.dev/eden-emu/eden.git")
sha256sums=('SKIP')
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
 }
build() {
	cd "$srcdir"
	cmake -B build -S $_pkgname -GNinja \
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
	install -Dm644 "$srcdir/$_pkgname/dist/72-yuzu-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	cd "$srcdir/$_pkgname/LICENSES"
	for file in *.txt;
	do
		install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
	done
}


