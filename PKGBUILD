# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-unyt
_module_name=unyt
pkgver=3.2.0
pkgrel=1
pkgdesc="A package for handling numpy arrays with units."
arch=(any)
url="https://pypi.org/project/unyt/"
license=('BSD')
depends=('python-numpy' 'python-sympy')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-packaging' 'python-setuptools' 'python-flit-core')
checkdepends=('python-pytest')
options=(!emptydirs)
source=(
    "https://pypi.io/packages/source/u/${_module_name}/${_module_name}-${pkgver}.tar.gz"
    'flit-core-4.patch'
)
sha256sums=('066c7c39219f63cb3024548f3977cf080edf2c4a6991f0508bfb6247e3fbc842'
            '35b2ccfcf95fff0bdddc2e3e4c6eca2254d2acf17d6792851b9ce7ee7ae0296a')

prepare() {
    cd "${srcdir}/${_module_name}-$pkgver"
    patch --forward --strip=1 < "${srcdir}/flit-core-4.patch"
}

build() {
    cd "${srcdir}/${_module_name}-$pkgver"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module_name}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

check() {
    cd "${srcdir}/${_module_name}-$pkgver"
    # NumPy 2.x does not emit the overflow warning asserted by this test.
    pytest --ignore=unyt/tests/test_version.py -k 'not test_overflow_warnings'
}
