# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aer
pkgname=python-${_pkgname}
pkgver=0.10.4
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
    'openblas: optimized BLAS library'
    'openmp: parallelization with OpenMP'
    'python-dask: parallel computing with task scheduling'
    'python-distributed: distributed task scheduler for Dask'
)
makedepends=(
    'cmake'
    'ninja'
    'pybind11'
    'python-build'
    'python-installer'
    'python-scikit-build'
    'python-setuptools'
    'python-wheel'
    'spdlog'
)
checkdepends=(
    'python-pytest'
    'python-fixtures'
    'python-ddt'
)
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz"
    "fix.patch"
)

sha256sums=(
    '7fe0f95863ee9190fadbf846ee5a7aa220b22c8a1ba5ec156cf2075af1bb3e80'
    'c847b08cf47e384bfec3c75aa38cc9b03f9c9976b40956f2b332a946f1a2c124'
)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/fix.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    DISABLE_CONAN=ON python -m build --wheel --no-isolation
}

# TODO
#check() {
#    cd "${srcdir}/${_pkgname}-${pkgver}"
#    python -m installer --destdir="$srcdir/test" dist/*.whl
#    export PYTHONPATH="$srcdir"/test/usr/lib/python3.10/site-packages
#    python -m pytest test
#}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # This deletes all folders except /usr/lib/python3.10/site-packages/qiskit/
    # See https://github.com/Qiskit/qiskit-aer/issues/1457
    find "${pkgdir}/usr" -mindepth 1 -maxdepth 1 -not -name lib -exec rm -rf '{}' \;

    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
