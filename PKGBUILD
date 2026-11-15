# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=simgear-git
pkgver=2024.2.0r6866.428f484c
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('x86_64')
url="https://gitlab.com/flightgear/simgear"
license=('LGPL-2.0-only')
depends=('c-ares' 'curl' 'expat' 'ffmpeg' 'glibc' 'libgcc' 'libglvnd' 'libstdc++' 'openal' 'flightgear-openscenegraph-git' 'xz' 'zlib')
makedepends=('boost' 'boost-libs' 'cmake' 'git')
provides=("simgear=${pkgver}")
conflicts=('simgear')
source=("simgear::git+https://gitlab.com/flightgear/simgear.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/simgear
  printf "%sr%s.%s" \
    "$(tr -d '\n' < simgear-version)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ENABLE_TESTS=OFF
    -D SIMGEAR_SHARED=ON
    -D SYSTEM_EXPAT=ON
    -S simgear
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
