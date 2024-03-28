# Maintainer:
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Paulo Castro <p dot oliveira dot castro at gmail dot com>

pkgbase=nest
pkgname=(nest python-nest)
pkgver=3.6
pkgrel=1
pkgdesc="Simulator for spiking neural network models"
arch=('x86_64')
url="https://www.nest-simulator.org/"
license=('GPL-2.0-or-later')
makedepends=('boost' 'cmake' 'cython' 'gsl' 'openmpi' 'python-mpi4py')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nest/nest-simulator/archive/v${pkgver}.tar.gz")
sha256sums=('68d6b11791e1284dc94fef35d84c08dd7a11322c0f1e1fc9b39c5e6882284922')

build() {
  cmake -B build -S "${pkgname}-simulator-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Dwith-boost=ON \
    -Dwith-gsl=ON \
    -Dwith-mpi=ON \
    -Dwith-python=ON \
    -Wno-dev
  cmake --build build
  DESTDIR="fakeinstall" cmake --install build
}

_install() {
  local src f dest
  for src; do
    f="${src#fakeinstall/}"
    dest="${pkgdir}/${f%/*}"
    install -dm755 "${dest}"
    mv -v "${src}" "${dest}"
  done
}

package_nest() {
  depends=('bash'
           'cblas'
           'gcc-libs'
           'glibc'
           'gsl'
           'libtool'
           'ncurses'
           'openmpi'
           'python'
           'python-docopt'
           'python-mpi4py'
           'python-nest'
           'readline')

  _install fakeinstall/usr/bin
  _install fakeinstall/usr/include/nest
  _install fakeinstall/usr/lib/nest
  _install fakeinstall/usr/share/nest/sli
}

package_python-nest() {
  pkgdesc+=" (python bindings)"
  depends=('gcc-libs'
           'glibc'
           'ipython'
           'python'
           'python-flask'
           'python-flask-cors'
           'python-h5py'
           'python-matplotlib'
           'python-numpy'
           'python-pandas'
           'python-pydot'
           'python-scipy'
           'python-werkzeug')

  _install fakeinstall/usr/lib/python*
}
