# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ompl-git
pkgver=r4625.31c3689d
pkgrel=1
pkgdesc="The Open Motion Planning Library (OMPL) consists of many state-of-the-art sampling-based motion planning algorithms (git)"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
depends=('boost-libs' 'python' 'python-matplotlib')
makedepends=('git' 'boost' 'cmake')
optdepends=('py++: Python binding'
            'ode: Plan using the Open Dynamics Engine'
            'eigen: For an informed sampling technique')
provides=('ompl')
conflicts=('ompl')
_name=ompl
source=("git+https://github.com/ompl/ompl.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

  cd "${srcdir}/${_name}"

  rm -rf build
  mkdir build

  cd "${srcdir}/${_name}/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPYTHON_EXEC=/usr/bin/python \
    -DCMAKE_CXX_FLAGS=-D_POSIX_VERSION \
    -DOMPL_REGISTRATION=Off ..
  make
}

#check() {
#  cd "${srcdir}/${_name}/build"
#  make test
#}

package() {
  cd "${srcdir}/${_name}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  cd build
  make DESTDIR=${pkgdir} install
}
