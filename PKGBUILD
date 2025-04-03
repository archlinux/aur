# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl2
pkgver=2.32.4
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
sha512sums=('36e2f9cc743703f03a4fa161b5a8134ded58be8952cd4a1e019ea013c744ece2ef83eac7a79257ee4ce9190dc79d33108cb6f2613d7f935aebe50af8be100a7b')

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
