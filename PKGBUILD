# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
# Contributor: VitalyR <vr AT vitalyr DOT com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=sdl3
pkgver=3.0.0.r5823.geb212ac
epoch=1
pkgrel=2
pkgdesc="Simple Directmedia Layer (Version 3 Pre-Release, Updated weekly)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.libsdl.org"
license=('Zlib')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'hidapi' 'libusb')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'fcitx5' 'libxss' 'cmake' 'jack' 'ninja' 'pipewire'
	     'libdecor' 'git' 'sndio')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver'
	    'pipewire: PipeWire audio driver'
	    'sndio: MIDI audio driver'
	    'libdecor: Wayland client decorations')
# Weekly manual updates since prerelease commits removed
source=("git+https://github.com/libsdl-org/SDL.git#commit=eb212ac4edcc331b8215dc706abca95af2d51d87")
sha256sums=('348e2a3ad7bb8615ad33171f644457f28e2e476ad216094ac50e8cf732d087e8')

pkgver(){
	cd "$srcdir/SDL"
	git describe --tags --long --abbrev=7 | sed 's/^prerelease-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"
	CFLAGS+=" -ffat-lto-objects"
	cmake -S SDL -B build -G Ninja \
	-D CMAKE_BUILD_TYPE=None \
	-D SDL_HIDAPI_LIBUSB=ON \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D SDL_RPI=OFF \
	-D SDL_STATIC=OFF \
	-D SDL_RPATH=OFF
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="${pkgdir}" cmake --install build
}

