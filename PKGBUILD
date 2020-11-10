# Maintainer: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-openal-git
pkgver=1.21.0.r11.g7e767702
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation (32-bit)"
arch=(x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(lib32-gcc-libs openal)
makedepends=(lib32-alsa-lib lib32-libpulse lib32-fluidsynth lib32-portaudio
             lib32-jack git cmake gcc-multilib)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/kcat/openal-soft")
md5sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --long --tags | sed 's/^openal-soft-//;s/-/.r/;s/-/./g'
}

build() {
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S openal-soft -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DALSOFT_UTILS=0 \
    -DALSOFT_NO_CONFIG_UTIL=1 \
    -DALSOFT_EXAMPLES=0 \
    -DALSOFT_INSTALL_CONFIG=0 \
    -DALSOFT_INSTALL_HRTF_DATA=0 \
    -DALSOFT_INSTALL_AMBDEC_PRESETS=0
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rv "$pkgdir"/usr/include
}
