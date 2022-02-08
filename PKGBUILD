# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aer
pkgname=python-${_pkgname}
pkgver=0.10.2
pkgrel=1
pkgdesc="A high performance simulator for quantum circuits that includes noise models"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-aer"
license=('Apache')
depends=(
    'cython'
    'muparserx'
    'nlohmann-json'
    'python-numpy'
    'python-qiskit-terra'
    'python-scipy'
)
optdepends=(
    'cuda: Parallelization with CUDA (NVIDIA)'
    'intel-tbb: Parallelization with Intel TBB'
    'openmp: Parallelization with OpenMP'
    'thrust: Parallelization (GPU/CPU) support'
    'python-dask: Parallel computing'
)
makedepends=(
    'cmake'
    'pybind11'
    'python-pip'
    'python-scikit-build'
    'python-setuptools'
    'spdlog'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('039c99349e012a1248dedd40c2e14f5f1616b52d6cc94ab05e16e4f2c8c7f121')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    DISABLE_CONAN=ON python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    # This deletes all folders except /usr/lib/python3.10/site-packages/qiskit/
    # See https://github.com/Qiskit/qiskit-aer/issues/1457
    find "${pkgdir}/usr" -mindepth 1 -maxdepth 1 -not -name lib -exec rm -rf '{}' \;
}
