# Maintainer: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgbase=openal-git
pkgname=(openal-git openal-examples-git)
pkgver=1.21.0.r11.g7e767702
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation"
arch=(i686 x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(gcc-libs)
makedepends=(alsa-lib libpulse fluidsynth portaudio jack qt5-base sdl2
             libsndfile ffmpeg libmysofa git cmake)
optdepends=('qt5-base: alsoft-config GUI Configurator'
            'fluidsynth: MIDI rendering'
            'libmysofa: makemhr tool')
source=("git+https://github.com/kcat/openal-soft")
md5sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --long --tags | sed 's/^openal-soft-//;s/-/.r/;s/-/./g'
}

build() {
  cmake -S openal-soft -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package_openal-git() {
  provides=("openal=$pkgver")
  conflicts=("openal")

  DESTDIR="$pkgdir" cmake --install build
  install -Dt "$pkgdir/usr/share/doc/openal" -m644 openal-soft/docs/*

### Split openal-examples
  mkdir -p examples/usr/bin
  for f in \
    alffplay alhrtf allatency alloopback almultireverb alplay alrecord \
    alreverb alstream altonegen
  do
    mv -v "$pkgdir/usr/bin/$f" examples/usr/bin/$f
  done
}

package_openal-examples-git() {
  pkgdesc+=" (example programs)"
  depends=("openal-git=$pkgver-$pkgrel" sdl2 libsndfile ffmpeg)
  provides=("openal-examples=$pkgver")
  conflicts=("openal-examples")

  mv examples/* "$pkgdir"
}
