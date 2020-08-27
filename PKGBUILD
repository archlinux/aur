# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgbase=openal-git
pkgname=(openal-git)
pkgver=1.18.1.r84.g5ec11a01
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
}
