# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=(openal-minimal-git)
pkgver=1.20.1
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation"
arch=(i686 x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(glibc)
makedepends=(alsa-lib libpulse sdl2
             git cmake ninja)
optdepends=('qt5-base: alsoft-config GUI Configurator')
source=("git+https://github.com/kcat/openal-soft")
md5sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --long --tags | sed 's/^openal-soft-//;s/-/.r/;s/-/./g'
}

build() {
  cd openal-soft
  cmake ../openal-soft -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DHAVE_OSS=0 \
    -DHAVE_PULSEAUDIO=0 \
    -DHAVE_COREAUDIO=0 \
    -DHAVE_WAVE=0 \
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
    -DALSOFT_BACKEND_OSS=0 \
    -DALSOFT_BACKEND_PULSEAUDIO=0 \
    -DALSOFT_BACKEND_COREAUDIO=0 \
    -DALSOFT_BACKEND_WAVE=0 \
    -DALSOFT_CPUEXT_SSE=1 \
    -DALSOFT_CPUEXT_SSE2=1 \
    -DALSOFT_CPUEXT_SSE3=1 \
    -DALSOFT_CPUEXT_SSE4_1=1 \
    -DALSOFT_CPUEXT_NEON=0 \
    -DALSOFT_BACKEND_SOLARIS=0 \
    -DALSOFT_BACKEND_SNDIO=0 \
    -DALSOFT_BACKEND_WINMM=0 \
    -DALSOFT_BACKEND_DSOUND=0 \
    -DALSOFT_BACKEND_WASAPI=0 \
    -DALSOFT_BACKEND_PORTAUDIO=0 \
    -DALSOFT_BACKEND_JACK=0 \
    -DALSOFT_BACKEND_OPENSL=0 \
    -DALSOFT_BACKEND_OBOE=0 \
    -DALSOFT_EMBED_HRTF_DATA=0 \
    -DALSOFT_HRTF_DEFS=0 \
    -DALSOFT_EXAMPLES=0 \
    -DALSOFT_UTILS=0 \
    -DALSOFT_TESTS=0 \
    -DALSOFT_INSTALL_HRTF_DATA=0 \
    -DALSOFT_INSTALL_AMBDEC_PRESETS=0 \
    -DALSOFT_INSTALL_EXAMPLES=0 \
    -DALSOFT_INSTALL_UTILS=0 \
    -DALSOFT_AMBDEC_PRESETS=0
  ninja $NINJAFLAGS
}

package_openal-minimal-git() {
  optdepends=('qt5-base: alsoft-config GUI Configurator'
              'fluidsynth: MIDI rendering')
  provides=("openal=$pkgver" openal)
  conflicts=("openal" "openal-git")

  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C openal-soft install
  install -Dt "$pkgdir/usr/share/doc/openal" -m644 openal-soft/docs/*
}
