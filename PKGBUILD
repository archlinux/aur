# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=simgear-git
pkgver=2020.4.0r6266.a5af7601
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('x86_64')
url="http://home.flightgear.org/"
license=('GPL')
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph')
makedepends=('boost' 'cmake' 'git' 'mesa')
provides=("simgear=${pkgver}")
conflicts=('simgear')
source=("simgear::git+https://git.code.sf.net/p/flightgear/simgear#branch=next")
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

package() {
  cd "$srcdir"/sgbuild
  make DESTDIR="$pkgdir" install
}
