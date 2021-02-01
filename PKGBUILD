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
    -DALSOFT_BACKEND_WAVE=0 \
    -DHAVE_SSE=1 \
    -DHAVE_SSE2=1 \
    -DHAVE_SSE3=1 \
    -DHAVE_SSE4_1=1 \
    -DHAVE_NEON=0 \
    -DHAVE_SOLARIS=0 \
    -DHAVE_SNDIO=0 \
    -DHAVE_WASAPI=0 \
    -DHAVE_WINMM=0 \
    -DHAVE_PORTAUDIO=0 \
    -DHAVE_JACK=0 \
    -DHAVE_OBOE=0 \
    -DHAVE_OPENSL=0 \
    -DALSOFT_CPUEXT_SSE=1 \
    -DALSOFT_CPUEXT_SSE2=1 \
    -DALSOFT_CPUEXT_SSE3=1 \
    -DALSOFT_CPUEXT_SSE4_1=1 \
    -DALSOFT_CPUEXT_NEON=0 \
    -DALSOFT_BACKEND_SOLARIS=0 \
    -DALSOFT_BACKEND_WINMM=0 \
    -DALSOFT_BACKEND_DSOUND=0 \
    -DALSOFT_BACKEND_WASAPI=0 \
    -DALSOFT_BACKEND_PORTAUDIO=0 \
    -DALSOFT_BACKEND_JACK=0 \
    -DALSOFT_BACKEND_OPENSL=0 \
    -DALSOFT_BACKEND_OBOE=0 \
    -DALSOFT_EMBED_HRTF_DATA=0 \
    -DALSOFT_INSTALL_HRTF_DATA=0 \
    -DALSOFT_INSTALL_AMBDEC_PRESETS=0 \
    -DALSOFT_INSTALL_EXAMPLES=0 \
    -DALSOFT_INSTALL_UTILS=0
  ninja $NINJAFLAGS
}

package() {
  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C build install
  rm -rv "$pkgdir"/usr/include
}
