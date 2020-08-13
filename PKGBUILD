# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-drizzlepac
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.1.8
pkgrel=1
pkgdesc="AstroDrizzle for HST images"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/scientific-community/software/drizzlepac.html"
license=('BSD')
makedepends=('python-setuptools'
             'python-relic'
             'python-astropy')
#            'python-numpydoc'
#            'python-sphinx_rtd_theme'
#            'python-stsci_rtd_theme'
#            'python-stsci.tools'
#            'python-stsci.convolve'
#            'python-stsci.image'
#            'python-stsci.imagestats'
#            'python-stsci.imagemanip'
#            'python-stsci.ndimage'
#            'python-stsci.skypac'
#            'python-stsci.stimage'
#            'python-stwcs'
#            'python-stregion'
#            'python-fitsblender'
#            'python-nictools')
#checkdepends=('python-pytest-remotedata' 'python-nose' 'python-ci_watson' 'python-crds')
checkdepends=('python-pytest'
              'python-stsci.skypac'
              'python-ci_watson'
              'python-fitsblender')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/LICENSE.txt")
md5sums=('44e4658c3af5e1cac72608e4625434e6'
         'SKIP')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs ${srcdir}/LICENSE.txt .
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-drizzlepac() {
    depends=('python>=3.5'
             'python-nose'
             'python-matplotlib'
             'python-requests'
             'python-scikit-learn>=0.20'
             'python-spherical_geometry>=1.2.17'
             'python-stsci.tools>=3.6'
             'python-stsci.image>=2.3.0'
             'python-stsci.imagestats'
             'python-stsci.skypac>=1.0'
             'python-stsci.stimage'
             'python-stwcs>=1.5.3'
             'python-tweakwcs>=0.6.3'
             'python-stregion'
             'python-fitsblender'
             'python-acstools'
             'python-nictools'
             'python-astroquery'
             'python-photutils>=0.7'
             'python-pysynphot'
             'python-lxml'
             'python-scikit-image>=0.14.2')
    optdepends=('python-drizzlepac-doc: Documentation for DrizzlePac')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/tests/__init__.py"
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/tests/__pycache__"/__init__*
}

#package_python-drizzlepac-doc() {
#    pkgdesc="Documentation for DrizzlePac"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
