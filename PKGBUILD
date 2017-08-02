# Maintainer: Kozeid <kozeid2@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgbase=openal-git
pkgname=(openal-git openal-examples-git)
pkgver=1.18.1.r4.g8a735d0b
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation"
arch=(i686 x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(glibc)
makedepends=(alsa-lib libpulse fluidsynth portaudio jack qt5-base sdl2 sdl_sound ffmpeg
             git cmake ninja)
source=("git+https://github.com/kcat/openal-soft")
md5sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --long --tags | sed 's/^openal-soft-//;s/-/.r/;s/-/./g'
}

build() {
  rm -rf build examples
  mkdir build examples
  cd build
  cmake ../openal-soft -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib
  ninja
}

package_openal-git() {
  optdepends=('qt5-base: alsoft-config GUI Configurator'
              'fluidsynth: MIDI rendering')
  provides=("openal=$pkgver")
  conflicts=("openal")

  DESTDIR="$pkgdir" ninja -C build install
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
