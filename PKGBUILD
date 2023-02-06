# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgbase=lib32-openal
pkgname=(lib32-openal)
pkgver=1.23.0
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation (32-bit)"
arch=(x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(
  lib32-gcc-libs
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
optdepends=(
  'lib32-fluidsynth: MIDI rendering'
)
_commit=70c14cd560db819f180073052f4c2bfae5cf3c31  # tags/1.23.0
source=("git+https://github.com/kcat/openal-soft#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --tags | sed 's/^openal-soft-//;s/[^-]*-g/r&/;s/-/+/g'
}

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
  provides+=(libopenal.so)

  DESTDIR="$pkgdir" cmake --install build
  rm -rv "$pkgdir"/usr/{include,share,bin}
}

# vim:set sw=2 sts=-1 et:
