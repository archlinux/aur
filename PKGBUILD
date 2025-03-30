# Maintainer: redponike <proton (dot) me>
# Contributor: Martino Pilia <martino.pilia@gmail.com>

pkgname=python-skorch
_pkgname=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="A scikit-learn compatible neural network library that wraps pytorch"
arch=('any')
url="https://github.com/skorch-dev/skorch"
license=('BSD-3-Clause')
depends=(
	'python-numpy'
	'python-pytorch'
	'python-scikit-learn'
	'python-scipy'
	'python-tabulate'
	'python-tqdm'
	'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-flaky' 'python-pytest-cov' 'python-tokenizers')
source=(
    "https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "0001-fix-parsing-code-for-doc-py313.diff::$url/pull/1082.diff"
)
sha256sums=('020b8c848fcc3b80cd7b17b96b35445cec3b95a4d104dd1e7055bcd6aaa1d2b6'
            'd1b712a7ac1589f9f423f43b42053ce18c4425736eccaa3e193b69285e71d336')

prepare() {
    cd "${_pkgname}-${pkgver}"
    # Patch the regex parsing in classifier.py as tests aren't passing with Python 3.13
    patch -p1 -i "$srcdir/0001-fix-parsing-code-for-doc-py313.diff"
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH="skorch/tests" pytest -vv --deselect "skorch/tests/test_net.py::TestNeuralNet" \
                                         --deselect "skorch/tests/test_history.py::TestDistributedHistoryMultiprocessing" \
                                         --deselect "skorch/tests/test_hf.py::TestAccelerate" \
                                         --deselect "skorch/tests/test_hf.py::TestHfHubStorage" \
                                         --deselect "skorch/tests/test_net.py::TestTrimForPrediction::test_can_be_copied" \
                                         --ignore skorch/tests/test_probabilistic.py
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
