# Maintainer : Benjamin Chretien <chretien at lirmm dot fr>

pkgname=spacevecalg-git
_name=spacevecalg
pkgver=r97.9d97669
pkgrel=1
pkgdesc="Implementation of spatial vector algebra with the Eigen 3 linear algebra library."
arch=('i686' 'x86_64')
url="https://github.com/jorisv/SpaceVecAlg"
license=('GPLv3')
depends=('eigen3' 'python2' 'eigen3topython')
makedepends=('doxygen' 'cmake' 'git' 'pkg-config' 'boost' 'python2-pybindgen')
provides=('spacevecalg')
source=("${_name}::git+https://github.com/jorisv/SpaceVecAlg")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build()
{
  cd "${srcdir}/${_name}"
  git submodule init
  git submodule update

  mkdir -p ${srcdir}/build && cd ${srcdir}/build

  cmake "${srcdir}/${_name}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
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
