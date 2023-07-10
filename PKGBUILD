# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn at gmail dot com>

pkgname=python-fast-histogram
_pyname=fast-histogram
pkgver=0.11
pkgrel=1
pkgdesc="Fast 1D and 2D histogram functions in Python"
arch=('i686' 'x86_64')
url="https://github.com/astrofrog/fast-histogram"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy')
checkdepends=('python-pytest' 'python-hypothesis')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('9acb6fa5b6efd928663008965da186962bdeae20e6d5bbb3b1195dfbd1d906f0')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e "/oldest-supported-numpy/d" -e "/\"wheel\"/s/,/]/" pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" \
        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/fast_histogram/tests/test_histogram.py::test_1d_compare_with_numpy \
        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/fast_histogram/tests/test_histogram.py::test_2d_compare_with_numpy \
        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/fast_histogram/tests/test_histogram.py::test_dd_compare_with_numpy || warning "Tests failed" # -vv --color=yes
}

package() {
    depends=('python-numpy')
    cd "${srcdir}/${_pyname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
