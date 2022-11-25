pkgname='python-cvxpy'
_module='cvxpy'
pkgver='1.2.2'
pkgrel=1
pkgdesc="A domain-specific language for modeling convex optimization problems"
url="http://github.com/cvxgrp/cvxpy/"
depends=(
    'python'
    'python-ecos'
    'python-fastcache'
    'python-multiprocess'
    'python-numpy'
    'python-scipy'
    'python-toolz')
makedepends=('python-setuptools')
optdepends=('python-diffcp' 'python-cvxopt' 'python-osqp' 'python-scs')
checkdepends=('glpk' 'python-pytest' 'python-cvxopt' 'python-osqp' 'python-scs')
license=('Apache')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cvxgrp/cvxpy/archive/v${pkgver}.tar.gz"
        "scipy_1.9_bugfix.patch::https://patch-diff.githubusercontent.com/raw/cvxpy/cvxpy/pull/1931.patch")
sha256sums=('b776f9829b8d9ece0aceb46e340aa681479ba67e6e0bfa4fd5be91524e4e37e3'
            'd6bd50a2834e52e05703a851dd916d223aab849293e15314b704d7f48cd2b0f8')

prepare() {
    cd "${_module}-${pkgver}"
    patch -p1 < ../scipy_1.9_bugfix.patch
}

build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "${_module}-${pkgver}"
    python setup.py build_ext --inplace
    pytest cvxpy/tests
}
