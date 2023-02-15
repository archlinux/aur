# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-acstools
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.5.0
pkgrel=1
pkgdesc="Python Tools for ACS (Advanced Camera for Surveys) Data"
arch=('any')
url="https://acstools.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
#'python-pandas' 'python-astropy' 'python-beautifulsoup4' 'python-sphinx-automodapi' 'python-sphinx_rtd_theme' 'python-matplotlib')
checkdepends=('python-pytest-astropy-header'
              'python-pytest-remotedata'
              'python-astropy'
#             'python-stsci.tools'
#             'python-beautifulsoup4'
              'python-requests'
              'python-matplotlib'
              'python-ci_watson'
              'python-scikit-image>=0.11'
              )  # stsci.tools -> astropy
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('2d8253a883ac19ba56bc2fc1be2f1d9b')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C doc html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest -Wdefault --remote-data || warning "Tests failed" # -vv --color=yes
}

package() {
    depends=('python>=3.8' 'python-astropy>=3.1' 'python-requests' 'python-yaml')
    optdepends=('python-matplotlib'
                'python-scipy'
                'python-scikit-image'
                'python-stsci.imagestats'
                'python-acstools-doc: Documentation for Python ACS Tools')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-acstools-doc() {
#    pkgdesc="Documentation for Python ACS Tools"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
