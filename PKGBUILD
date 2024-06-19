# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stcal
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.7.1
pkgrel=1
pkgdesc="STScI tools and algorithms used in calibration pipelines"
arch=('i686' 'x86_64')
url="https://stcal.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=3.4'
             'cython>=0.29.21'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy'
             'python-sphinx-asdf'
             'python-stsci_rtd_theme'
             'python-gwcs')
checkdepends=('python-pytest-doctestplus'
              'python-opencv'
              'python-scipy')   # gwcs already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ab83cae0aa418a4c747e7fc78fbe7cb0')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mv src/{,_}${_pyname}
    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-stcal() {
    depends=('python>=3.10'
             'python-gwcs>=0.18.1'
             'python-scipy>=1.7.2'
             'python-opencv>=4.6.0.66')
    optdepends=('python-stcal-doc: Documentation for stcal')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-stcal-doc() {
    pkgdesc="Documentation for Python STCal"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
