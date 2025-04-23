# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=simgear-git
pkgver=2024.2.0r6571.a630ad75
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('x86_64')
url="https://www.flightgear.org/"
license=('GPL')
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph')
makedepends=('boost' 'cmake' 'git' 'mesa')
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
  mkdir -p "$srcdir"/sgbuild
  cd "$srcdir"/sgbuild
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSIMGEAR_SHARED=ON \
    -DENABLE_TESTS=OFF \
    ../simgear
  make
}

prepare() {
  cd simgear
  # patch -p1 < ../../simgear-osg.patch # Fix build with openscenegraph 3.6.5
  patch -p1 < ../../0001-remove_boost_lexical.patch
  patch -p1 < ../../0002-remove_boost_containers.patch
}

package() {
  cd "$srcdir"/sgbuild
  make DESTDIR="$pkgdir" install
}
