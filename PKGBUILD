# Maintainer : Benjamin Chretien <chretien at lirmm dot fr>

pkgname=rbdyn-git
_name=rbdyn
pkgver=20140925
pkgver() {
  date +%Y%m%d
}
pkgrel=1
pkgdesc="A set of classes and functions to model the dynamics of rigid body systems."
arch=('i686' 'x86_64')
url="https://github.com/jorisv/RBDyn"
license=('GPLv3')
depends=('eigen3' 'python2')
makedepends=('doxygen' 'cmake' 'git' 'pkg-config' 'boost')
provides=('rbdyn')
source=("${_name}::git+https://github.com/bchretien/RBDyn")
md5sums=('SKIP')

build()
{
  cd "${srcdir}/${_name}"
  git submodule init
  git submodule update

  mkdir -p ${srcdir}/build && cd ${srcdir}/build

  cmake "${srcdir}/${_name}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so

  make
}

check()
{
  cd ${srcdir}/build
  make test
}

package()
{
  cd ${srcdir}/build
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
