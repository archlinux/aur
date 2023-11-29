# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-drizzlepac
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.6.2
pkgrel=1
pkgdesc="AstroDrizzle for HST images"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/scientific-community/software/drizzlepac.html"
license=('BSD')
makedepends=('python-setuptools-scm>=3.4'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-astropy>=5.0.4'
             'python-markupsafe')
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
checkdepends=('python-pytest'
              'python-matplotlib'
              'python-scikit-learn'
              'python-scikit-image'
              'python-spherical_geometry'
              'python-stwcs'
              'python-stsci.skypac'
              'python-ci_watson'
              'python-fitsblender'
              'python-stsci.image'
              'python-stregion'
              'python-tweakwcs'
              'python-astroquery'
              'python-photutils'
              'python-bokeh'
              'python-pypdf2')
#              'python-pytest-remotedata'
##             'python-nictools'
#              'python-pandas'
#              'python-crds'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
       "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/tests/hap/ACSWFC3ListDefault50.csv")
md5sums=('0fd1bd62e67b2306aa3e6597a6a086dd'
         'acaf7d8bcf0f6244042bba0df3d03679')

get_pyinfo() {
     [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
             python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e "/markupsafe/s/<=2.0.1//" pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   ln -rs ${srcdir}/ACSWFC3ListDefault50.csv "build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap"
    # skip some tests that need lots of online data or cost lots of time; some files are missing in pypi package
    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" \
        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_pipeline.py::TestSingleton::test_astrometric_singleton[iaaua1n4q] \
        --ignore=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_svm_canary.py \
        --ignore=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_svm_hrcsbc.py \
        --ignore=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_svm_ibqk07.py \
        --ignore=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_svm_ibyt50.py \
        --ignore=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_svm_j97e06.py \
        --ignore=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_svm_je281u.py \
        --ignore=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_svm_wfc3ir.py || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_pipeline.py::TestSingleton::test_astrometric_singleton[iaaua1n4q] \
#       --ignore=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_run_svmpoller.py \
#       --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_pipeline.py::TestSingleton::test_astrometric_singleton[iaaua1n4q] \
#       --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/tests/hap/test_pipeline.py::TestSingleton::test_astrometric_singleton[iacs01t4q] || warning "Tests failed" # -vv --color=yes
}

package_python-drizzlepac() {
    depends=('python>=3.9'
             'python-scipy'
             'python-matplotlib'
             'python-requests'
             'python-scikit-learn>=0.20'
             'python-stsci.tools>=4.0'
             'python-stsci.image>=2.3.4'
             'python-stsci.imagestats'
             'python-stsci.skypac>=1.0.9'
             'python-stsci.stimage'
             'python-stwcs>=1.5.3'
             'python-tweakwcs>=0.8.2'
             'python-stregion>=1.1.7'
             'python-fitsblender>=0.4.2'
             'python-bokeh'
             'python-pandas'
             'python-spherical_geometry>=1.2.22'
             'python-astroquery>=0.4'
             'python-astrocut'
             'python-photutils>1.5.0'
             'python-lxml'
             'python-pypdf2'
             'python-scikit-image>=0.14.2'
             'python-pytables'
             'python-typing_extensions>4'
             'python-markupsafe')
#            'python-acstools'
#            'python-nictools')
    optdepends=('python-yaml: HAP-pipeline specific'
                'python-pysynphot'
                'python-drizzlepac-doc: Documentation for DrizzlePac')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -r ${pkgdir}/$(get_pyinfo site)/{doc,src,tests}
#   rm "${pkgdir}/usr/lib/python$(get_pyver)/site-packages/tests/__init__.py"
#   rm "${pkgdir}/usr/lib/python$(get_pyver)/site-packages/tests/__pycache__"/__init__*
}

#package_python-drizzlepac-doc() {
#    pkgdesc="Documentation for DrizzlePac"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
