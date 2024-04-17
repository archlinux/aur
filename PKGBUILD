# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn at gmail dot com>

pkgname=python-fast-histogram
_pyname=fast_histogram
pkgver=0.14
pkgrel=1
pkgdesc="Fast 1D and 2D histogram functions in Python"
arch=('i686' 'x86_64')
url="https://github.com/astrofrog/fast-histogram"
license=('BSD-2-Clause')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy')
checkdepends=('python-pytest'
              'python-hypothesis')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('390973b98af22bda85c29dcf6f008ba0d626321e9bd3f5a9d7a43e5690ea69ea')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count \
#       --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/fast_histogram/tests/test_histogram.py::test_1d_compare_with_numpy \
#       --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/fast_histogram/tests/test_histogram.py::test_2d_compare_with_numpy \
#       --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/fast_histogram/tests/test_histogram.py::test_dd_compare_with_numpy #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package() {
    depends=('python-numpy')
    cd "${srcdir}/${_pyname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
