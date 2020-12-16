# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-openal-minimal-git
pkgver=1.18.1.r84.g5ec11a01
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation (32-bit)"
arch=(x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(lib32-glibc openal)
makedepends=(lib32-alsa-lib lib32-libpulse
             git cmake ninja gcc-multilib)
provides=("lib32-openal=$pkgver" lib32-openal)
conflicts=(lib32-openal lib32-openal-git)
source=("git+https://github.com/kcat/openal-soft")
md5sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --long --tags | sed 's/^openal-soft-//;s/-/.r/;s/-/./g'
}

build() {
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  mkdir -p build
  cd build
  cmake ../openal-soft -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DALSOFT_UTILS=0 \
    -DALSOFT_NO_CONFIG_UTIL=1 \
    -DALSOFT_EXAMPLES=0 \
    -DALSOFT_TESTS=0 \
    -DALSOFT_CONFIG=0 \
    -DALSOFT_HRTF_DEFS=0 \
    -DALSOFT_BACKEND_SNDIO=0 \
    -DALSOFT_AMBDEC_PRESETS=0 \
    -DHAVE_OSS=0 \
    -DHAVE_PULSEAUDIO=0 \
    -DHAVE_COREAUDIO=0 \
    -DHAVE_WAVE=0 \
    -DALSOFT_BACKEND_OSS=0 \
    -DALSOFT_BACKEND_PULSEAUDIO=0 \
    -DALSOFT_BACKEND_COREAUDIO=0 \
    -DALSOFT_BACKEND_WAVE=0
  ninja $NINJAFLAGS
}

package() {
  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C build install
  rm -rv "$pkgdir"/usr/include
}
