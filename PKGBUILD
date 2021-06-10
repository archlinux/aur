# Maintainer: Wil Thomason <wbthomason@cs.cornell.edu>
# Former maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ompl-git
pkgver=r4678.253e8c0e
pkgrel=1
pkgdesc="The Open Motion Planning Library (OMPL) consists of many state-of-the-art sampling-based motion planning algorithms (git)"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
provides=('ompl')
conflicts=('ros-melodic-ompl' 'ompl')
replaces=('ros-melodic-ompl' 'ompl')
_name=ompl
depends=('boost-libs')
makedepends=('git' 'boost' 'cmake' 'ninja' 'pkgconf' 'eigen')
optdepends=('python: Python bindings'
            'py++: Python bindings'
            'ode: Plan using the Open Dynamics Engine'
            'pypy: Speed up generating Python bindings'
            'spot: Used for constructing finite automata from LTL formulae'
            'morse-simulator-git: MORSE simulation engine OMPL plugin'
            'triangle: Used to create triangular decompositions of polygonal 2D environments'
            'flann: Additional nearest-neighbor query backend'
            'python-numpy: Python bindings'
            'r: Running Planner Arena locally'
            'castxml: Python bindings'
            'pygccxml: Python bindings')
source=("git+https://github.com/ompl/ompl.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # NOTE: To get Python bindings, you currently need to install pyplusplus through pip3. The AUR
  # py++ package will *not* work. Hopefully that will get fixed soon...
  cd "${srcdir}/${_name}" || exit
  rm -rf build
  mkdir build
  cd build

  # NOTE: -march=native causes test failures by slowing down PRM and PRMstar on AMD processors for
  # unknown reasons. Uncomment the following to remove it if you encounter this issue.
  # CXXFLAGS=$(echo $CXXFLAGS | sed 's/-march=native//g')
  cmake -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DOMPL_REGISTRATION=Off ..
  cmake --build .
}

check() {
  cd "${srcdir}/${_name}/build" || exit
  ctest
}

package() {
  cd "${srcdir}/${_name}" || exit
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd build || exit
  DESTDIR=${pkgdir} ninja install
}
