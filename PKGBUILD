# Maintainer: Kozeid <kozeid2@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgbase=openal-git
pkgname=(openal-git openal-examples-git)
pkgver=1.18.1.r0.gbf9c3640
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation"
arch=(i686 x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(glibc)
makedepends=(alsa-lib pkgconfig cmake libpulse qt5-base fluidsynth portaudio jack sdl2 sdl_sound
             ffmpeg git)
source=("git+https://github.com/kcat/openal-soft")
md5sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --long --tags | sed 's/^openal-soft-//;s/-/.r/;s/-/./g'
}

build() {
  mkdir -p build examples
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        ../openal-soft
  make
}

package_openal-git() {
  optdepends=('qt5-base: alsoft-config GUI Configurator'
              'fluidsynth: MIDI rendering')
  provides=("openal=$pkgver")
  conflicts=("openal")

  make -C build DESTDIR="$pkgdir" install

  install -Dt "$pkgdir/usr/share/doc/openal" -m644 openal-soft/docs/*

### Split openal-examples
  mv -v "$pkgdir"/usr/bin/al{ffplay,hrtf,latency,loopback,record,reverb,stream} examples/
}

package_openal-examples-git() {
  pkgdesc+=" (example programs)"
  depends=("openal-git=$pkgver-$pkgrel" sdl2 sdl_sound ffmpeg)
  provides=("openal-examples=$pkgver")
  conflicts=("openal-examples")

  mkdir "$pkgdir/usr"
  mv -v examples "$pkgdir/usr/bin"
}
