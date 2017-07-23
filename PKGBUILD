# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-openal
pkgver=1.18.0
pkgrel=3
pkgdesc="Cross-platform 3D audio library, software implementation (32-bit)"
arch=(x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(lib32-glibc openal)
makedepends=(lib32-alsa-lib pkgconfig cmake lib32-libpulse lib32-portaudio lib32-jack
             git gcc-multilib)
_commit=61e43d4039277c538f3f6e0af7c988e7d71d8558  # tags/openal-soft-1.18.0
source=("git+https://github.com/kcat/openal-soft#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --tags | sed 's/^openal-soft-//;s/-/+/g'
}

prepare() {
  mkdir build
  cd openal-soft

  # https://bugs.archlinux.org/task/54908
  git cherry-pick -n d4f3490a880f779f460332689a396ade69840f50
}

build() {
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_LIBDIR=lib32 ../openal-soft
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
  rm -rv "$pkgdir"/usr/{include,share,bin}
}
