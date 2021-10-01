# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-drizzlepac
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.3.0
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
checkdepends=('python-pytest-remotedata'
              'python-matplotlib'
              'python-scikit-learn'
              'python-scikit-image'
              'python-stsci.skypac'
              'python-ci_watson'
              'python-fitsblender'
              'python-nictools'
              'python-stsci.image'
              'python-stregion'
              'python-tweakwcs'
              'python-astroquery'
              'python-photutils'
              'python-pandas'
              'python-bokeh'
              'python-pypdf2'
              'python-crds')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/tests/hap/ACSWFC3ListDefault50.csv")
md5sums=('c64ede548c342166dbad3f1e38b5e178'
         'acaf7d8bcf0f6244042bba0df3d03679')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    cd ${srcdir}/${_pyname}-${pkgver}/build/lib.linux-${CARCH}-${_pyver}

    ln -rs ${srcdir}/ACSWFC3ListDefault50.csv tests/hap
    pytest || warning "Tests failed"
}

package_python-drizzlepac() {
    depends=('python>=3.7'
             'python-scipy'
             'python-matplotlib'
             'python-requests'
             'python-scikit-learn>=0.20'
             'python-spherical_geometry>=1.2.17'
             'python-stsci.tools>=4.0'
             'python-stsci.image>=2.3.4'
             'python-stsci.imagestats'
             'python-stsci.skypac>=1.0.7'
             'python-stsci.stimage'
             'python-stwcs>=1.5.3'
             'python-tweakwcs>=0.7.2'
             'python-stregion'
             'python-fitsblender'
             'python-acstools'
             'python-nictools')
    optdepends=('python-astroquery>=0.4: HAP-pipeline specific'
                'python-photutils>=1.0.0: HAP-pipeline specific'
                'python-bokeh: HAP-pipeline specific'
                'python-pandas: HAP-pipeline specific'
                'python-pypdf2: HAP-pipeline specific'
                'python-pytables: HAP-pipeline specific'
                'python-yaml: HAP-pipeline specific'
                'python-pysynphot'
                'python-lxml: HAP-pipeline specific'
                'python-scikit-image'
                'python-drizzlepac-doc: Documentation for DrizzlePac')
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
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
