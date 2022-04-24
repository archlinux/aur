# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-openal
pkgver=1.22.0
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation (32-bit)"
arch=(x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(lib32-gcc-libs openal)
makedepends=(lib32-alsa-lib lib32-libpulse lib32-fluidsynth lib32-portaudio
             lib32-jack lib32-pipewire git cmake ninja)
optdepends=('lib32-fluidsynth: MIDI rendering')
options=(debug)
_commit=c1c63a27de66cd44ef756b190a73bfa8bc6dbbab  # master
source=("git+https://github.com/kcat/openal-soft#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --tags | sed 's/^openal-soft-//;s/-/+/g'
}

prepare() {
  cd openal-soft

  # Fixup missing tag
  git tag -f 1.22.0 c1c63a27de66cd44ef756b190a73bfa8bc6dbbab
}

build() {
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S openal-soft -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_LIBDIR=lib32
  cmake --build build
}

package() {
  provides+=(libopenal.so)

  DESTDIR="$pkgdir" cmake --install build
  rm -rv "$pkgdir"/usr/{include,share,bin}
}
