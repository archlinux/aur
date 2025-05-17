# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pvextractor
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.4
pkgrel=1
pkgdesc="Position-velocity diagram extractor"
arch=('any')
url="https://pvextractor.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-astropy'
             'python-scipy')  # wheel required by new setuptools
checkdepends=('python-pytest-astropy-header'
              'python-pytest-doctestplus'
              'python-pytest-xvfb'
              'xorg-server-xvfb'
#             'python-pytest-xdist'
              'python-matplotlib'
              'python-spectral-cube'
              'python-pyqt6')
#             'python-pyqt5') # scipy <- radio-beam
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-doc-build-warning.patch')
md5sums=('005cce9ff817ac777f7e3e751797130d'
         'ee80bc266d21f35c07a59361254517dd')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i '/a-z/s|"^|r"^|' ${_pyname}/pvregions.py
#   sed -i -e '/PyQt6/d' -e 's/QtAgg/Qt5Agg/g' ${_pyname}/tests/test_gui.py
    sed -i -e "/version =/c version = '${pkgver}'" -e "/release =/c release = '${pkgver}'" docs/conf.py
    patch -Np1 -i "${srcdir}/fix-doc-build-warning.patch"
#   sed -i "/----/s/-/~/g" programmatic.rst
#   sed -i "/ds9.rst/a\   plotting.rst" index.rst
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-pvextractor() {
    depends=('python>=3.8'
             'python-matplotlib>=3.5'
             'python-scipy>=1.8'
             'python-qtpy>=2.0'
             'python-spectral-cube>=0.4')
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
