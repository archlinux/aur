# Maintainer: gfrank227 [at] gmail [dot] com
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: crueter <crueter at crueter dot x y z>
# Contributor: rcf <ryan.farley@gmx.com>
_pkgname=eden
pkgname=$_pkgname-beta
pkgver=0.2.1
_pkgver=v0.2.1
pkgrel=4
pkgdesc="Nintendo Switch emulator forked from yuzu - beta and test releases"
arch=('x86_64' 'aarch64')
url=https://eden-emulator.github.io/
license=('GPL-3.0-or-later')
provides=('eden')
conflicts=('eden' 'eden-git' 'eden-bin' 'eden-preview-bin')
depends=('libusb' 'libva' 'qt6-webengine' 'brotli' 'qt6-charts' 'hicolor-icon-theme' 'qt6-base' 'sdl2' 'gcc-libs' 'ffmpeg' 'zydis' 'zycore-c' 'quazip-qt6' 'mbedtls' 'enet' 'cubeb' 'game-devices-udev')
makedepends=('git' 'cmake' 'catch2' 'boost' 'cpp-httplib' 'spirv-headers' 'boost-libs' 'wireless_tools' 'vulkan-headers' 'vulkan-utility-libraries' 'nlohmann-json' 'ninja' 'gamemode' 'renderdoc' 'qt6-multimedia' 'qt6-tools' 'nasm' 'opencl-headers' 'doxygen' 'cpp-jwt')
optdepends=('gamemode: Gamemoded support')
options=('!debug')
source=("eden-v${pkgver}.tar.gz::https://git.eden-emu.dev/eden-emu/eden/archive/${_pkgver}.tar.gz"
		"60e1032771.patch"
		"7c0e993b5b.patch")
sha256sums=('a43ea2886b75204438f691a4ddfad99e88b508e30431978dd13fba1c22440d19'
			'2d73f9f8473644385efd73507f828f172cfe2e3e829e962584bb1d0429e25e3f'
            'e078d47ee07f93432c155ab03f5589ad1166466a2a0f5ab9832c0f3c2cb7a573')

prepare() {
	cd $srcdir/eden
	patch -p1 < "$srcdir/60e1032771.patch"
	patch -p1 < "$srcdir/7c0e993b5b.patch"
}

build() {
	cd "$srcdir"
	cmake -B build -S $_pkgname -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DUSE_DISCORD_PRESENCE=ON \
		-DCPM_USE_LOCAL_PACKAGES=ON \
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DDiscordRPC_FORCE_BUNDLED=ON \
		-Dxbyak_FORCE_BUNDLED=ON \
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
	install -Dm644 "$srcdir/$_pkgname/dist/72-yuzu-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	sed -i 's/KERNEL==/ACTION!="remove", KERNEL==/' "$pkgdir/usr/lib/udev/rules.d/72-eden-input.rules"
	cd "$srcdir/$_pkgname/LICENSES"
	for file in *.txt;
	do
		install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
	done
}


