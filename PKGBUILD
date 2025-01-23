# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: VitalyR <vr AT vitalyr DOT com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=lib32-sdl3
pkgver=3.2.0
pkgrel=3
epoch=1
pkgdesc="Simple Directmedia Layer (Version 3)"
arch=('x86_64' 'i686')
url="https://www.libsdl.org"
license=('Zlib')
depends=('sdl3' 'lib32-libxext' 'lib32-libxrender' 'lib32-libx11' 'lib32-libgl' 'lib32-libxcursor' 'lib32-libusb' 'lib32-vulkan-driver' 'lib32-libxi' 'lib32-libxfixes' 'lib32-libxrandr' 'lib32-libxkbcommon' 'lib32-mesa' 'lib32-libxss' 'lib32-alsa-lib' 'lib32-libpulse' 'lib32-pipewire' 'lib32-wayland' 'zenity' 'lib32-systemd' 'lib32-libdecor')
makedepends=('wayland-protocols' 'cmake' 'lib32-jack' 'ninja' 'lib32-sndio')
optdepends=('lib32-jack: JACK audio driver'
	    'lib32-sndio: MIDI audio driver')
source=("https://github.com/libsdl-org/SDL/archive/refs/tags/release-${pkgver}.tar.gz")
sha256sums=('a8a614624531883e9288960d52713d228374c5d5b00228e410ce351bb32842c0')

build() {
	cd "$srcdir"
	export CFLAGS+=" -m32"
	export CXXFLAGS+=" -m32"
	export LDFLAGS+=" -m32"
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	cmake -S SDL-release-${pkgver} \
	-B build -G Ninja \
	-D CMAKE_BUILD_TYPE=None \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D CMAKE_INSTALL_LIBDIR=lib32 \
	-D SDL_STATIC=OFF \
	-D SDL_RPATH=OFF \
	-D SDL_TEST_LIBRARY=OFF
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="${pkgdir}" cmake --install build
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/share/man"
	mv "${pkgdir}/usr/share/licenses/SDL3" "${pkgdir}/usr/share/licenses/lib32-sdl3"
}
