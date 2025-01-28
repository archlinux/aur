# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl2
pkgver=2.30.11
pkgrel=2
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)"
arch=('x86_64')
url="https://www.libsdl.org"
license=('Zlib')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'hidapi' 'libusb')
makedepends=('alsa-lib' 'dbus' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'fcitx5' 'libxss' 'cmake' 'jack' 'ninja' 'pipewire'
             'libdecor' 'vulkan-driver' 'vulkan-headers' 'libsamplerate')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver'
            'pipewire: PipeWire audio driver'
            'libdecor: Wayland client decorations')
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL2-${pkgver}.tar.gz")
sha512sums=('cd4c040ebe4ec74250e32b401a292658353721dda30ad1066522b2a9de9a07560313978880a0bad7e7f5103cc14278fcbe27dbc5a188189e7fb6f097e7308550')

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
