# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: VitalyR <vr AT vitalyr DOT com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=lib32-sdl3
pkgver=3.0.0.r5823.geb212ac
pkgrel=1
epoch=1
pkgdesc="Simple Directmedia Layer (Version 3 Pre-Release, Updated weekly)"
arch=('x86_64' 'i686')
url="https://www.libsdl.org"
license=('Zlib')
depends=('sdl3' 'lib32-glibc' 'lib32-libxext' 'lib32-libxrender' 'lib32-libx11' 'lib32-libgl' 'lib32-libxcursor' 'hidapi' 'lib32-libusb')
makedepends=('lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse' 'lib32-libxrandr' 'lib32-libxinerama' 'lib32-wayland' 'lib32-libxkbcommon'
             'wayland-protocols' 'lib32-libxss' 'cmake' 'lib32-jack' 'ninja' 'lib32-pipewire' 'lib32-libdecor' 'git')
optdepends=('lib32-alsa-lib: ALSA audio driver'
            'lib32-libpulse: PulseAudio audio driver'
            'lib32-jack: JACK audio driver'
	    'lib32-pipewire: PipeWire audio driver'
	    'lib32-libdecor: Wayland client decorations')
# Switching to weekley updates as all SDL3 tags have been removed, keeping in line with `sdl3`
source=("git+https://github.com/libsdl-org/SDL.git#commit=eb212ac4edcc331b8215dc706abca95af2d51d87")
sha256sums=('348e2a3ad7bb8615ad33171f644457f28e2e476ad216094ac50e8cf732d087e8')

pkgver(){
        cd "$srcdir/SDL"
        git describe --tags --long --abbrev=7 | sed 's/^prerelease-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"
	#CFLAGS+=" -ffat-lto-objects"
	export CFLAGS+=" -m32"
	export CXXFLAGS+=" -m32"
	export LDFLAGS+=" -m32"
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	cmake -S SDL -B build -G Ninja \
	-D CMAKE_BUILD_TYPE=None \
	-D SDL_HIDAPI_LIBUSB=ON \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D CMAKE_INSTALL_LIBDIR=lib32 \
	-D SDL_RPI=OFF \
	-D SDL_STATIC=OFF \
	-D SDL_RPATH=OFF
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="${pkgdir}" cmake --install build
	rm -rf "${pkgdir}/usr/lib/cmake"
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/share/man"
	mv "${pkgdir}/usr/share/licenses/SDL3" "${pkgdir}/usr/share/licenses/lib32-sdl3-git"
}

