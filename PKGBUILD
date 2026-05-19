# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-acstools
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.8.1
pkgrel=1
pkgdesc="Python Tools for ACS (Advanced Camera for Surveys) Data"
arch=('any')
url="https://acstools.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')
#            'python-sphinx-automodapi'
#            'python-sphinx_rtd_theme'
#            'python-numpydoc'
#            'python-astropy')
# conftest.py
checkdepends=('python-pytest-astropy-header'
              'python-pytest-remotedata'
##            'python-stsci.tools'
###           'python-beautifulsoup4'
              'python-ci_watson'
              'python-scikit-image')  # stsci.tools, {ci_watson -> crds} -> astropy, requests skimage -> matplotlib, scipy
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('29dfb0807c336bae3a4c9ca765671496')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make SPHINXOPTS="" -C doc html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-acstools() {
    depends=('python>=3.10' 'python-astropy' 'python-requests' 'python-yaml')
    optdepends=('python-matplotlib'
                'python-scipy'
                'python-scikit-image>=0.11'
                'python-stsci.imagestats'
                'python-photutils'
                'python-dask'
                'python-acstools-doc: Documentation for Python ACS Tools')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-acstools-doc() {
#    pkgdesc="Documentation for Python ACS Tools"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc//build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
#}
