# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgbase=lib32-openal
pkgname=(
  lib32-openal
)
pkgver=1.25.0
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation (32-bit)"
url="https://github.com/kcat/openal-soft"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  lib32-gcc-libs
  lib32-glibc
  openal
)
makedepends=(
  cmake
  git
  lib32-alsa-lib
  lib32-fluidsynth
  lib32-jack
  lib32-libpulse
  lib32-pipewire
  lib32-portaudio
  ninja
)
source=("git+https://github.com/kcat/openal-soft#tag=$pkgver")
b2sums=('3dff86afc1e8950b82adf27f723166a986699d881ba5cff3069a63f6aecf44a539b38295e59507d13666c4dc52a808c05de2ce1898d54d44348ba80a9e8adbb4')

prepare() {
  cd openal-soft
}

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_LIBDIR=lib32
  )

  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S openal-soft -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

package_lib32-openal() {
  optdepends=(
    'lib32-fluidsynth: MIDI rendering'
  )
  provides+=(libopenal.so)

  DESTDIR="$pkgdir" cmake --install build
  rm -rv "$pkgdir"/usr/{include,share,bin}
}

# vim:set sw=2 sts=-1 et:
