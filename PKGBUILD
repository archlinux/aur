# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

_pkgname=sdl3
pkgname=sdl3-trigger-rumble-hack
pkgver=3.4.18
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 3) (with trigger rumble hack)"
arch=('x86_64')
url="https://www.libsdl.org"
license=('Zlib')
depends=(
  'glibc'
  'libxext'
  'libxrender'
  'libx11'
  'libgl'
  'libxcursor'
  'hidapi'
  'libusb'
)
makedepends=(
  'cmake'
  'ninja'
  'jack'
  'wayland-protocols'
  'alsa-lib'
  'mesa'
  'libpulse'
  'libxrandr'
  'libxinerama'
  'wayland'
  'libxkbcommon'
  'ibus'
  'libxss'
  'pipewire'
  'libdecor'
  'vulkan-headers'
  'sndio'
)
optdepends=(
  'alsa-lib: ALSA audio driver'
  'libpulse: PulseAudio audio driver'
  'jack: JACK audio driver'
  'pipewire: PipeWire audio driver'
  'vulkan-driver: vulkan renderer'
  'sndio: sndio audio driver'
  'libdecor: Wayland client decorations'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL3-${pkgver}.tar.gz"
  "0001-joystick-enable-the-trigger-rumble-hack-only-for-mod.patch"
)
sha512sums=('e59df7c19af3ce567e89b987aaf7852ea680beb52acd97dff0fad0688b20a8e0724a4ce33c655a88095d25dadba0e5615c95297ae6327bec149c902ffd2eb15b'
            '7dc8b5f1de359a8deb28de6f443d6fc41bc46ee237bc23a7e7af359087cb33850ce07bfa3001bebc011c5cfad48af04dc14dc3c71757443640bcc672e41ea869')

prepare() {
  cd "SDL3-${pkgver}"

  # Apply patches
  for patch in "${srcdir}"/0001-*.patch; do
    echo "Applying patch: ${patch}"
    patch -p1 < "${patch}"
  done
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  cmake -S SDL3-${pkgver} \
    -B build -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SDL_STATIC=OFF \
    -D SDL_RPATH=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm755 build/test/testcontroller "$pkgdir/usr/bin/testcontroller"
  install -Dm644 SDL3-${pkgver}/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
