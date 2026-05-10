# Maintainer: MiguVT <contacto@miguvt.com>
# Contributor: gfrank227 [at] gmail [dot] com
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: crueter <crueter at crueter dot x y z>
# Contributor: rcf <ryan.farley@gmx.com>
_pkgname=eden
pkgname=$_pkgname-nightly
pkgver=0.0.0.r0.g86f2f0b
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu - nightly builds"
arch=('x86_64' 'aarch64')
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
provides=('eden')
conflicts=('eden' 'eden-beta' 'eden-git' 'eden-bin' 'eden-preview-bin')
depends=('libusb' 'libva' 'qt6-webengine' 'qt6-charts' 'brotli' 'hicolor-icon-theme' 'qt6-base' 'sdl2' 'gcc-libs' 'ffmpeg' 'zydis' 'zycore-c' 'quazip-qt6' 'mbedtls' 'fmt' 'enet' 'cubeb')
makedepends=('git' 'cmake' 'catch2' 'boost' 'cpp-httplib' 'spirv-headers' 'boost-libs' 'wireless_tools' 'vulkan-headers' 'vulkan-utility-libraries' 'nlohmann-json' 'ninja' 'enet' 'gamemode' 'renderdoc' 'qt6-multimedia' 'qt6-tools' 'nasm' 'opencl-headers' 'doxygen' 'cpp-jwt')
optdepends=('gamemode: Gamemoded support')
options=('!lto' '!debug')
_commit=86f2f0bc36845ac45de315d9ba78c569b62d866a
source=("git+https://git.eden-emu.dev/eden-emu/eden.git#commit=${_commit}"
		"3751.patch"
		"bd6dd7ecec.patch")
sha256sums=('2c7d846fb99a6f49dfd53539f28f49b0c45de75081ac121230d7773c04e2dc2e'
            '106a8f2053c6d52951a312b07a09050423362128a7d26344af0bb0f4495fb856'
            '8d441c5152211510d4fdd5ea39f99d4ba3d4b86c7126d352872fd36bfb492d43')
pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/.git//'
}
prepare() {
	cd $srcdir/eden
	patch -p1 < $srcdir/3751.patch
	patch -p1 < $srcdir/bd6dd7ecec.patch
}
build() {
	cd "$srcdir"
	cmake -B build -S $_pkgname -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
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
	install -Dm644 "$srcdir/$_pkgname/dist/72-yuzu-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	sed -i 's/KERNEL==/ACTION!="remove", KERNEL==/' "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	cd "$srcdir/$_pkgname/LICENSES"
	for file in *.txt;
	do
		install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
	done
}


