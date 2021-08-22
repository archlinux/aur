# Maintainer: Nick Lay <layns(at)mail(dot)uc(dot)edu>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>

# Based on the dolphin-emu-git PKGBUILD with modifications

_mainpkgname="dolphin-emu"
pkgname=("$_mainpkgname-primehack-git")
pkgver=1.0.4.r951.ge353752b6d
pkgrel=1
pkgdesc='Dolphin fork intended to give Metroid Prime Trilogy mouselook controls'
arch=('x86_64')
url="https://dolphin-emu.org"
license=('GPL2')
depends=(
	'alsa-lib' 'bluez-libs' 'enet' 'hidapi' 'libevdev' 'libgl' 'libpng'
	'libpulse' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls' 'pugixml' 'qt5-base'
	'sfml' 'zlib'
	'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so'
	'libminiupnpc.so' 'libswscale.so' 'libudev.so' 'libusb-1.0.so'
)
makedepends=('cmake' 'git' 'python')
optdepends=('pulseaudio: PulseAudio backend')
source=("dolphin::git+https://github.com/shiiion/dolphin.git")
sha256sums=('SKIP')

_sourcedirectory="dolphin"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	git submodule update --init
	if [ -d 'build/' ]; then rm -rf 'build/'; fi
	mkdir 'build/'
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	cmake -S '.' -B 'build/' \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DUSE_SHARED_ENET=ON \
		-DDISTRIBUTOR=archlinux.org
	make -C 'build/'
}

package() {
	pkgdesc="$pkgdesc"
	provides=("$_mainpkgname-git")
	conflicts=("$_mainpkgname-git")

	cd "$srcdir/$_sourcedirectory/"
	make DESTDIR="$pkgdir" -C 'build/' install
	install -Dm644 'Data/51-usb-device.rules' "$pkgdir/usr/lib/udev/rules.d/51-usb-device.rules"

	rm -rf "$pkgdir/usr/bin/primehack-dolphin"
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib/libdiscord-rpc.a"
	rm -rf "$pkgdir/usr/share/man/man6/primehack-dolphin.6"
}

