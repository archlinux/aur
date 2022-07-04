# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pvextractor
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.3
pkgrel=1
pkgdesc="Position-velocity diagram extractor"
arch=('any')
url="https://pvextractor.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-astropy'
             'python-scipy')
checkdepends=('python-pytest-astropy-header' 'python-spectral-cube')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-doc-build-warning.patch')
md5sums=('10ea0f356c9f7b196a31d6fb01828646'
         'ee80bc266d21f35c07a59361254517dd')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix-doc-build-warning.patch"
#   sed -i "/----/s/-/~/g" programmatic.rst
#   sed -i "/ds9.rst/a\   plotting.rst" index.rst
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   This tests currently segfaults with Matplotlib 3.1 and later
    pytest --deselect=pvextractor/tests/test_gui.py::test_gui || warning "Tests failed"
}

package_python-pvextractor() {
    depends=('python>=3.6' 'python-scipy' 'python-matplotlib>=2.0' 'python-qtpy' 'python-spectral-cube')
    optdepends=('python-pvextractor-doc: Documentation for pvextractor')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-pvextractor-doc() {
    pkgdesc="Documentation for Python pvextractor module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
