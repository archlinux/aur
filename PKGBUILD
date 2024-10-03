# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
# Contributor: VitalyR <vr AT vitalyr DOT com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=sdl3
pkgver=3.0.0.r6432.ga0de6c4
epoch=1
pkgrel=1
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
_commit=a0de6c4abf2f21b3df7b4291967fb81c461fe0f0
source=("git+https://github.com/libsdl-org/SDL.git#commit=${_commit}")
sha256sums=('619f7b213b297426e2435263350f37bdef39c7df5558433f38df5e754ece248f')

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

