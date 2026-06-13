# Maintainer: MiguVT <contacto@miguvt.com>
# Contributor: gfrank227 [at] gmail [dot] com
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: crueter <crueter at crueter dot x y z>
# Contributor: rcf <ryan.farley@gmx.com>
_pkgname=eden
pkgname=$_pkgname-nightly
pkgver=1781122546.5219b9f3d2
pkgrel=1
pkgdesc="Nightly release of the Eden Nintendo Switch emulator (built from source)"
arch=('x86_64' 'aarch64')
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
provides=('eden')
conflicts=('eden' 'eden-beta' 'eden-git' 'eden-bin' 'eden-preview-bin' 'eden-nightly-bin')
depends=('libusb' 'libva' 'qt6-webengine' 'qt6-charts' 'brotli' 'hicolor-icon-theme' 'qt6-base' 'sdl2' 'gcc-libs' 'ffmpeg' 'zydis' 'zycore-c' 'quazip-qt6' 'mbedtls' 'fmt' 'enet' 'cubeb' 'qt6-multimedia')
makedepends=('git' 'cmake' 'catch2' 'boost' 'cpp-httplib' 'spirv-headers' 'boost-libs' 'wireless_tools' 'vulkan-headers' 'vulkan-utility-libraries' 'nlohmann-json' 'ninja' 'enet' 'gamemode' 'renderdoc' 'qt6-tools' 'nasm' 'opencl-headers' 'doxygen' 'cpp-jwt')
optdepends=('gamemode: Gamemoded support')
options=('lto' '!debug')
_commit=5219b9f3d2b92802352dda16273d520abbe179b4
source=("git+https://git.eden-emu.dev/eden-emu/eden.git#commit=${_commit}")
sha256sums=('2e8de83218ab406fc721f867bf214e348d5192ccf31a0105945cfb522e0f6595')
pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/.git//'
}
build() {
	cd "$srcdir"
    cmake -B build -S "$_pkgname" -GNinja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DYUZU_ENABLE_LTO=ON \
        -DUSE_DISCORD_PRESENCE=ON \
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
        -Wno-dev
	cmake --build build
}
package() {
	cd "$srcdir"
	DESTDIR="$pkgdir/" cmake --install build
	install -Dm644 "$srcdir/$_pkgname/dist/72-eden-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	sed -i 's/KERNEL==/ACTION!="remove", KERNEL==/' "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	cd "$srcdir/$_pkgname/LICENSES"
	for file in *.txt;
	do
		install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
	done
}


