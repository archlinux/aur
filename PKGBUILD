# Maintainer: VitalyR <vr AT vitalyr DOT com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=sdl3-git
pkgver=3.2.4.r132.g52e64f816
pkgrel=1
pkgdesc="Simple Directmedia Layer (Version 3)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.libsdl.org"
license=('Zlib')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'hidapi' 'libusb')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'libxss' 'cmake' 'jack' 'ninja' 'pipewire'
	         'libdecor' 'git' 'sndio')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver'
            'pipewire: PipeWire audio driver'
            'sndio: MIDI audio driver'
            'libdecor: Wayland client decorations')
source=("git+https://github.com/libsdl-org/SDL.git")
provides=("sdl3")
conflicts=("sdl3")
sha512sums=('SKIP')

pkgver() {
  cd SDL
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/preview.//'
}

build() {
	CFLAGS+=" -ffat-lto-objects"
	cmake -S SDL -B build -G Ninja \
	-D CMAKE_BUILD_TYPE=None \
	-D SDL_HIDAPI_LIBUSB=ON \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D SDL_STATIC=OFF \
	-D SDL_RPATH=OFF
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}

