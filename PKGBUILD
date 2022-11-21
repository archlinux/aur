# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Tim Hütz <tim@huetz.biz>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sebastien Binet <binet@cern.ch>

_pkg=mpi4py
pkgname=python38-${_pkg}
pkgver=3.1.3
pkgrel=2
pkgdesc="Python bindings for the Message Passing Interface (MPI) standard"
arch=(x86_64)
url="https://github.com/mpi4py/mpi4py"
license=(BSD)
depends=(python38 openmpi)
makedepends=(python38-setuptools cython)
checkdepends=(inetutils)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha256sums=('f1e9fae1079f43eafdd9f817cdb3fd30d709edc093b5d5dada57a461b2db3008')

build() {
    cd ${_pkg}-${pkgver}
    python3.8 setup.py build
}

check() {
    # This is required starting with OpenMPI 3.0 when trying to run more
    # processes than the number of available cores
    export OMPI_MCA_rmaps_base_oversubscribe=yes
    # We don’t have CUDA by default
    export OMPI_MCA_opal_warn_on_missing_libcuda=0

    cd ${_pkg}-${pkgver}
    python3.8 setup.py test
}

package() {
    cd ${_pkg}-${pkgver}
    python3.8 setup.py install --root="${pkgdir}" --skip-build --optimize=1
    install -Dm644 LICENSE.rst -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
