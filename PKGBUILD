# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-openal
pkgver=1.19.0
pkgrel=2
pkgdesc="Cross-platform 3D audio library, software implementation (32-bit)"
arch=(x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(lib32-glibc openal)
makedepends=(lib32-alsa-lib lib32-libpulse lib32-fluidsynth lib32-portaudio lib32-jack
             git cmake ninja gcc-multilib)
_commit=96aacac10ca852fc30fd7f72f3e3c6ddbe02858c  # tags/openal-soft-1.19.0
source=("git+https://github.com/kcat/openal-soft#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --tags | sed 's/^openal-soft-//;s/-/+/g'
}

prepare() {
  mkdir build
  cd openal-soft
  git cherry-pick -n 8bacb5dfb8ef910586fcf5b5cd89526ec81061e8
}

build() {
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  cmake ../openal-soft -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib32
  ninja
}

package() {
  optdepends=('lib32-fluidsynth: MIDI rendering')

  DESTDIR="$pkgdir" ninja -C build install
  rm -rv "$pkgdir"/usr/{include,share,bin}
}
