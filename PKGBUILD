# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=sdl2-git
pkgver=prerelease.2.23.1.r43.gbd4969613
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.libsdl.org"
license=('MIT')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'hidapi' 'libusb')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'fcitx5' 'libxss' 'cmake' 'jack' 'ninja' 'pipewire'
	     'libdecor' 'git')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver'
	    'pipewire: PipeWire audio driver'
	    'libdecor: Wayland client decorations')
source=("git+https://github.com/libsdl-org/SDL")
provides=("sdl2=$pkgver")
conflicts=(sdl2 sdl2-minimal-hg)
sha512sums=('SKIP')

pkgver() {
  cd SDL
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	CFLAGS+=" -ffat-lto-objects"
	cmake -S SDL -B build -G Ninja \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D SDL_RPI=OFF \
	-D SDL_STATIC=OFF \
	-D SDL_RPATH=OFF
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	# For some reason, this isn't named correctly and we have to fix it to reflect the actual staticlib name.
	sed -i "s/libSDL2\.a/libSDL2main.a/g" "$pkgdir"/usr/lib/cmake/SDL2/SDL2Targets-noconfig.cmake
	install -Dm644 SDL/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chown -R root:root "$pkgdir"
}

