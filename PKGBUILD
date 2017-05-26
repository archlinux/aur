# Maintainer: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=flightgear-git
pkgver=20170526
pkgrel=1
_gitname=flightgear
pkgdesc="An open-source, multi-platform flight simulator"
arch=('i686' 'x86_64')
url="http://flightgear.org/"
license=('GPL')
depends=('libxmu' 'libxi' 'zlib' 'libxrandr' 'glu' 'openal' 'fgdata-git' 'openscenegraph' 'subversion')
optdepends=('qt5-base: fgfs --launcher'
            'qt5-declarative: fgfs --launcher')
makedepends=('boost' 'cmake' 'mesa' 'sharutils' 'simgear-git' 'qt5-base' 'qt5-declarative')
provides=('flightgear-git' 'flightgear')
conflicts=('flightgear')
source=(git://git.code.sf.net/p/flightgear/flightgear)
md5sums=('SKIP')

pkgver() {
  echo "$(date +"%Y%m%d")"
}

build() {
  cd ${srcdir}/${_gitname}
  git checkout next
  mkdir -p ${srcdir}/${_gitname}-build
  cd "${srcdir}/${_gitname}-build/"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT=1 \
    -DFG_DATA_DIR:STRING="/usr/share/flightgear" \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    ../${_gitname}

  make || return 1
}

package(){
  cd "${srcdir}/${_gitname}-build/"
  make DESTDIR="$pkgdir" install
}

