# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: J0k3r <moebius282@gmail.com>

pkgname=lib32-sdl2
pkgver=2.32.0
pkgrel=1
pkgdesc='A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard'
arch=(x86_64)
url=https://www.libsdl.org
license=(Zlib)
depends=(
  lib32-glibc
  lib32-libxext
  lib32-libxrender
  lib32-libx11
  lib32-libgl
  lib32-libxcursor
  sdl2
)
makedepends=(
  cmake
  git
  jack
  lib32-alsa-lib
  lib32-libpulse
  lib32-libxinerama
  lib32-libxkbcommon
  lib32-libxrandr
  lib32-libxss
  lib32-mesa
  lib32-vulkan-driver
  vulkan-headers
  lib32-pipewire
  lib32-wayland
  ninja
  lib32-libsamplerate
  wayland-protocols
)
optdepends=(
  'lib32-alsa-lib: ALSA audio driver'
  'lib32-jack: JACK audio driver'
  'lib32-libpulse: PulseAudio audio driver'
  'lib32-pipewire: PipeWire audio driver'
)
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL2-${pkgver}.tar.gz")
sha512sums=('a91b8105125f06118e8bfce2a5553fe053f7158dd02f06a36cfc535f09c401eb7da11072e576c6bf6e41fa2e02b08483b9cc4e11c658578b762e1b6c326a45bb')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export CFLAGS+=" -ffat-lto-objects"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  cmake -S SDL2-${pkgver} -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DSDL_DLOPEN=ON \
    -DSDL_RPATH=OFF \
    -DSDL_STATIC=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  sed -i "s/libSDL2\.a/libSDL2main.a/g" "$pkgdir"/usr/lib32/cmake/SDL2/SDL2Targets-noconfig.cmake
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2 "${pkgdir}"/usr/share/licenses/lib32-sdl2
}

# vim: ts=2 sw=2 et:
