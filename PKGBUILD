# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl2
pkgver=2.32.8
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)"
arch=('x86_64')
url="https://www.libsdl.org"
license=('Zlib')
provides=('sdl2-compat')
conflicts=('sdl2-compat')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'hidapi' 'libusb')
makedepends=('alsa-lib' 'dbus' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'libxss' 'cmake' 'jack' 'ninja' 'pipewire'
             'libdecor' 'vulkan-driver' 'vulkan-headers' 'libsamplerate')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver'
            'pipewire: PipeWire audio driver'
            'libdecor: Wayland client decorations')
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL2-${pkgver}.tar.gz")
sha512sums=('484c33638e7bd1002815bb1f6a47a292d1eaf0b963598dde65f4a3e077dfe75ee35b9ea4b3b767365b3ef4f613c4d69ce55b5e96675de562994344e83a978272')

prepare(){
  cd "$srcdir/SDL2-$pkgver"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  cmake -S SDL2-${pkgver} -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SDL_STATIC=OFF \
    -D SDL_RPATH=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # For some reason, this isn't named correctly and we have to fix it to reflect the actual staticlib name.
  sed -i "s/libSDL2\.a/libSDL2main.a/g" "$pkgdir"/usr/lib/cmake/SDL2/SDL2Targets-noconfig.cmake

  install -Dm644 SDL2-${pkgver}/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
