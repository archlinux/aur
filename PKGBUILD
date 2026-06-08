pkgname='python-diffcp'
_module='diffcp'
pkgver='1.1.7'
pkgrel=1
pkgdesc="Differentiating through a cone program"
url="http://github.com/cvxgrp/diffcp/"
depends=(python-cvxpy python-ecos python-multiprocess python-numpy python-scs python-scipy python-threadpoolctl)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-scikit-build-core' 'pybind11' 'cmake' 'ninja' 'eigen')
optdepends=()
checkdepends=('python-pytest' 'python-clarabel' 'python-ecos' 'python-scs')
license=('Apache-2.0')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cvxgrp/diffcp/archive/v${pkgver}.tar.gz")
sha256sums=('817439ef13526cc4ef9600edad4b1b0ace6bf05fe10768be2366129331eac134')

prepare() {
    cd "${_module}-${pkgver}"
    # Drop the bundled Eigen and build against the system package instead.
    rm -rf cpp/external/eigen
}

build() {
    cd "${_module}-${pkgver}"
    python -m build --wheel --no-isolation \
        -C cmake.define.CMAKE_CXX_FLAGS="-I/usr/include/eigen3"
}

package() {
    cd "${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

check() {
    cd "${_module}-${pkgver}"
    local _site
    _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    python -m installer --destdir=test_install dist/*.whl
    PYTHONPATH="$(realpath "test_install${_site}")" pytest tests
}
