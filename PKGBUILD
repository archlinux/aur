# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl-python
_dir=orocos_kinematics_dynamics
_pkgname=python_orocos_kdl
pkgver=1.5.0
pkgrel=2
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains (Python binding)"
arch=('i686' 'x86_64')
url="https://www.orocos.org/kdl"
license=('GPL')
depends=('orocos-kdl' 'python-sip4')
makedepends=('cmake' 'sip4')

# Git commit has for version-specific submodules
pkgver_pybind11='8de7772cc72daca8e947b79b83fea46214931604' # {_pkgname}/pybind11

source=("https://github.com/orocos/${_dir}/archive/v${pkgver}.tar.gz"
        "pybind11.tar.gz::https://github.com/pybind/pybind11/archive/${pkgver_pybind11}.tar.gz"
)
sha512sums=('5fc9c336d6ed31ad59a5bdf6ee06444cac29beae090b9026b34f35a3cb4cdf1cd6c33af621205b8d6a5201070e679531c8b5bbdeb8a91cd1d8061153b0e47e49'
            '9bb688209791bd5f294fa316ab9a8007f559673a733b796e76e223fe8653d048d3f01eb045b78aa1843f7eacf97f6e2ee090ac68fed2b43856eb0c4813583204')

prepare() {
  pybinddir="pybind11-${pkgver_pybind11}"

  # Copy in the pybind11 source
  rm -rf "${srcdir}/${_dir}-${pkgver}/${_pkgname}/pybind11"
  cp -R "${srcdir}/${pybinddir}" "${srcdir}/${_dir}-${pkgver}/${_pkgname}/pybind11"
}

build() {
  cd "${srcdir}/${_dir}-${pkgver}/${_pkgname}"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DPYTHON_VERSION=3 \
        ..
  make
}

package() {
  cd "${srcdir}/${_dir}-${pkgver}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
  find ${pkgdir}/usr -maxdepth 1 -type f -exec rm {} \;
}
