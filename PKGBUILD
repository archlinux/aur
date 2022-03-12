# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-drizzlepac
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.4.0
pkgrel=1
pkgdesc="AstroDrizzle for HST images"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/scientific-community/software/drizzlepac.html"
license=('BSD')
makedepends=('python-setuptools-scm>=3.4'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy'
             'python-astropy>=4.3'
             'python-markupsafe<=2.0.1')
#            'python-relic'
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
              'python-spherical_geometry'
              'python-stwcs'
              'python-stsci.skypac'
              'python-ci_watson'
              'python-fitsblender'
#             'python-nictools'
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
md5sums=('5a796f4a70b61c7a42512bcd88863bdd'
         'acaf7d8bcf0f6244042bba0df3d03679')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/d" pyproject.toml
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs ${srcdir}/ACSWFC3ListDefault50.csv "build/lib.linux-${CARCH}-${_pyver}/tests/hap"
    # skip some tests that need lots of online data or cost lots of time; some files are missing in pypi package
    pytest "build/lib.linux-${CARCH}-${_pyver}" \
        --ignore=build/lib.linux-${CARCH}-${_pyver}/tests/hap/test_svm_canary.py \
        --ignore=build/lib.linux-${CARCH}-${_pyver}/tests/hap/test_svm_hrcsbc.py \
        --ignore=build/lib.linux-${CARCH}-${_pyver}/tests/hap/test_svm_ibqk07.py \
        --ignore=build/lib.linux-${CARCH}-${_pyver}/tests/hap/test_svm_ibyt50.py \
        --ignore=build/lib.linux-${CARCH}-${_pyver}/tests/hap/test_svm_j97e06.py \
        --ignore=build/lib.linux-${CARCH}-${_pyver}/tests/hap/test_svm_je281u.py \
        --ignore=build/lib.linux-${CARCH}-${_pyver}/tests/hap/test_svm_wfc3ir.py \
        --deselect=build/lib.linux-${CARCH}-${_pyver}/tests/hap/test_pipeline.py::TestSingleton::test_astrometric_singleton[iaaua1n4q] \
        --deselect=build/lib.linux-${CARCH}-${_pyver}/tests/hap/test_pipeline.py::TestSingleton::test_astrometric_singleton[iacs01t4q] || warning "Tests failed"
}

package_python-drizzlepac() {
    depends=('python>=3.8'
             'python-scipy'
             'python-matplotlib'
             'python-requests'
             'python-scikit-learn>=0.20'
             'python-stsci.tools>=4.0'
             'python-stsci.image>=2.3.4'
             'python-stsci.imagestats'
             'python-stsci.skypac>=1.0.7'
             'python-stsci.stimage'
             'python-stwcs>=1.5.3'
             'python-tweakwcs>=0.7.2'
             'python-stregion'
             'python-fitsblender')
#            'python-acstools'
#            'python-nictools')
    optdepends=('python-astroquery>=0.4: HAP-pipeline specific'
                'python-photutils>=1.0.0: HAP-pipeline specific'
                'python-bokeh: HAP-pipeline specific'
                'python-pandas: HAP-pipeline specific'
                'python-spherical_geometry>=1.2.22: HAP-pipeline specific'
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
    python -m installer --destdir="${pkgdir}" dist/*.whl
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
