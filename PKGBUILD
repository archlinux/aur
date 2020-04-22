# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aer
pkgname=python-${_pkgname}
pkgver=0.5.0
pkgrel=1
pkgdesc="A high performance simulator for quantum circuits that includes noise models"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-aer"
license=('Apache')
depends=(
    'python-qiskit-terra'
    'cython'
    'openblas'
    'muparserx')
optdepends=(
    'thrust: Parallelization (GPU/CPU) support'
    'cuda: Parallelization with CUDA (NVIDIA)'
    'openmp: Parallelization with OpenMP'
    'intel-tbb: Parallelization with Intel TBB')
makedepends=(
    'python-setuptools'
    'cmake'
    'python-scikit-build')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz"
    "cmake.patch")

sha256sums=('259076ec7c2b26c06e2bce86b521f16c150210d54875b2fdcac5431807104838'
            '378188cb0789f56e51fed0ae16a06ed6f3def3210e3ec35384db4dbe61cc1f35')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Avoid python setup.py build to download cmake from PyPi
    #sed -i "/\bcmake\b/d" setup.py
    # Fix CMakeList.txt to use muparserx from AUR
    patch --forward --strip=1 --input="${srcdir}/cmake.patch"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
