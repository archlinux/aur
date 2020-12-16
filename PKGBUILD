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
    -DALSOFT_BACKEND_OSS=0 \
    -DALSOFT_BACKEND_PULSEAUDIO=0 \
    -DALSOFT_BACKEND_COREAUDIO=0 \
    -DALSOFT_BACKEND_WAVE=0
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
