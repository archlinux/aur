# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=ngsolve-git
pkgver=PKGVER
pkgrel=PKGREL
pkgdesc="A general purpose Finite Element Library on top of Netgen."
url=https://sourceforge.net/projects/ngsolve/
license=('LGPL2.1')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake')
depends=('lapack' 'blas' 'python-mpi4py' 'tix' 'glu' 'netgen-git' 'openmpi' 'suitesparse')
options=('!buildflags')
source=("${pkgname%-git}::git+http://git.code.sf.net/p/ngsolve/git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # now we build ngsolve
  cd "${srcdir}"/${pkgname%-git}
  mkdir build && cd build
  # We would like to install to ${pkgdir}/opt/netgen, but ngsolve uses this
  # variable to find netgen. So we provide /opt/netgen ...
  cmake -DINSTALL_DIR="/opt/netgen" -DCMAKE_BUILD_TYPE=RELEASE -DUSE_MPI=ON ..

  # ... and have to sed our way out of this.
  sed -i "s;CMAKE_INSTALL_PREFIX \"/opt/netgen\";CMAKE_INSTALL_PREFIX \"${pkgdir}/opt/netgen\";g" cmake_install.cmake

  make
}

package() {
  cd "${srcdir}"/${pkgname%-git}/build
  make install
}

