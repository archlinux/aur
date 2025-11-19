# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: VitalyR <vr AT vitalyr DOT com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=lib32-sdl3-git
pkgver=3.3.2.r251.g6d60cc65cf
pkgrel=1
pkgdesc="Simple Directmedia Layer (Version 3)"
arch=('x86_64' 'i686')
url="https://www.libsdl.org"
license=('Zlib')
depends=('sdl3' 'lib32-glibc' 'lib32-libxext' 'lib32-libxrender' 'lib32-libx11' 'lib32-libgl' 'lib32-libxcursor' 'hidapi' 'lib32-libusb')
makedepends=('lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse' 'lib32-libxrandr' 'lib32-libxinerama' 'lib32-wayland' 'lib32-libxkbcommon'
             'wayland-protocols' 'lib32-libxss' 'cmake' 'lib32-jack' 'ninja' 'lib32-pipewire'
	     'lib32-libdecor' 'git' 'lib32-sndio' 'vulkan-headers')
optdepends=('lib32-alsa-lib: ALSA audio driver'
            'lib32-libpulse: PulseAudio audio driver'
            'lib32-jack: JACK audio driver'
	    'lib32-pipewire: PipeWire audio driver'
	    'lib32-sndio: MIDI audio driver'
	    'lib32-libdecor: Wayland client decorations')
source=("git+https://github.com/libsdl-org/SDL.git")
provides=("lib32-sdl3")
conflicts=("lib32-sdl3")
sha512sums=('SKIP')

pkgver() {
  cd SDL
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/preview.//'
}

build() {
	export CFLAGS+=" -m32"
	export CXXFLAGS+=" -m32"
	export LDFLAGS+=" -m32"
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	cmake -S SDL -B build -G Ninja \
	-D CMAKE_BUILD_TYPE=None \
	-D SDL_HIDAPI_LIBUSB=ON \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D CMAKE_INSTALL_LIBDIR=lib32 \
	-D SDL_STATIC=OFF \
	-D SDL_RPATH=OFF
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	rm -rf "${pkgdir}/usr/lib/cmake"
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/share/man"
	mv "${pkgdir}/usr/share/licenses/SDL3" "${pkgdir}/usr/share/licenses/lib32-sdl3-git"
}

