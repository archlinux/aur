# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-openal
pkgver=1.20.0
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation (32-bit)"
arch=(x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(lib32-glibc openal)
makedepends=(lib32-alsa-lib lib32-libpulse lib32-fluidsynth lib32-portaudio
             lib32-jack git cmake)
_commit=c0cf323e1d56ce605e90927324d2fdafcfbb564a  # tags/openal-soft-1.20.0
source=("git+https://github.com/kcat/openal-soft#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --tags | sed 's/^openal-soft-//;s/-/+/g'
}

prepare() {
  cd openal-soft
}

build() {
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -Hopenal-soft -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_LIBDIR=lib32
  cmake --build build
}

package() {
  optdepends=('lib32-fluidsynth: MIDI rendering')

  DESTDIR="$pkgdir" cmake --build build --target install
  rm -rv "$pkgdir"/usr/{include,share,bin}
}
