# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: J0k3r <moebius282@gmail.com>

pkgname=lib32-sdl2
pkgver=2.32.2
pkgrel=2
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
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL2-${pkgver}.tar.gz"
        "pipewire.patch::https://github.com/libsdl-org/SDL/commit/d35bef64e913dd7d5dd3153a4b61f10ef837dad6.patch")
sha512sums=('9a608974a69b97fd5589bf8feed4742498f8f07731bcd5b99dd518089acda8b9b4216197b6adf7ca79ef1a9fe47c542033eefe94763e66229b1d9ba5207da5c5'
            'cf84c2d4f6d72db976b95a546c0ac48c1454b205f57452ec8d4fc716105eabdf3e2972da9ad25aa84b3930a5d6099858ff375ec085ab3504965fe5d2b6677d0e')

prepare() {
  cd "$srcdir/SDL2-$pkgver"
  patch -p1 < "$srcdir/pipewire.patch"
}

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
