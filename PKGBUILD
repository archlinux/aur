# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=simgear-git
pkgver=2020.4.0r5819.5e30d83a
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('x86_64')
url="http://home.flightgear.org/"
license=('GPL')
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph')
makedepends=('boost' 'cmake' 'git' 'mesa')
provides=("simgear=${pkgver}")
conflicts=('simgear')
options=('staticlibs')
source=("simgear::git+https://git.code.sf.net/p/flightgear/simgear#branch=next")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/simgear
  printf "%sr%s.%s" \
    "$(tr -d '\n' < simgear-version)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir"/simgear-build
  cd "$srcdir"/simgear-build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TESTS=off \
    ../simgear
  make
}

package() {
  cd "$srcdir"/simgear-build
  make DESTDIR="$pkgdir" install
}
