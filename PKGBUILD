# Maintainer: Kozeid <kozeid2@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-openal-git
pkgver=1.18.0.r103.g12db67f5
pkgrel=1
pkgdesc="A cross-platform 3D audio library (32-bit)"
arch=(x86_64)
url="http://www.openal.org/"
license=(LGPL)
depends=(lib32-glibc openal)
makedepends=(lib32-alsa-lib pkgconfig cmake lib32-libpulse lib32-portaudio lib32-jack
             git gcc-multilib)
source=("git+https://github.com/kcat/openal-soft")
md5sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --tags | sed 's/^openal-soft-//;s/-/.r/;s/-/./g'
}

build() {
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DALSOFT_UTILS=0 \
        -DALSOFT_NO_CONFIG_UTIL=1 \
        -DALSOFT_EXAMPLES=0 \
        -DALSOFT_TESTS=0 \
        -DALSOFT_CONFIG=0 \
        -DALSOFT_HRTF_DEFS=0 \
        -DALSOFT_AMBDEC_PRESETS=0 \
        ../openal-soft
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
  rm -rv "$pkgdir"/usr/include
}
