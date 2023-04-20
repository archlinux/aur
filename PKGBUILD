# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=sdl2-git
pkgver=2.26.0.r355.g120bc77e9
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
source=("git+https://github.com/libsdl-org/SDL#branch=SDL2")
provides=("sdl2=$pkgver")
conflicts=(sdl2 sdl2-minimal-hg)
sha512sums=('SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga

pkgver() {
  cd SDL
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	CFLAGS+=" -ffat-lto-objects"
	cmake -S SDL -B build -G Ninja \
	-D SDL_HIDAPI_LIBUSB=ON \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D SDL_RPI=OFF \
	-D SDL_STATIC=OFF \
	-D SDL_RPATH=OFF
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}

