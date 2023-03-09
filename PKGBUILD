# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ndcube
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.1.1
pkgrel=1
pkgdesc="Package for multi-dimensional contiguious and non-contiguious coordinate aware arrays"
arch=('any')
url="https://docs.sunpy.org/projects/ndcube"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx-changelog'
             'python-sphinx-gallery'
             'python-sphinxext-opengraph'
             'python-sunpy-sphinx-theme'
             'python-gwcs'
             'python-sunpy'
             'python-mpl-animators'
             'python-pytest-doctestplus'
             'graphviz')  # matplotlib <- mpl-animators
checkdepends=('python-pytest-doctestplus'
              'python-dask'
              'python-reproject')  # pytest-doctestplus gwcs mpl-animators sunpy already in makedep
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       'doc-use-local-fits.patch'
#       "https://www.astropy.org/astropy-data/tutorials/FITS-images/HorseHead.fits"
#       "https://github.com/sunpy/ndcube/raw/main/changelog/README.rst")
md5sums=('5c17a5bce55d101870a588d93babd9d0')
#        'b50513a0bb73290d65317d0d44ae9fb9'
#        'SKIP'
#        'SKIP')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   install -Dm644 -t changelog ${srcdir}/README.rst # README not needed
    mkdir -p changelog
#   cp ${srcdir}/*.fits examples
#   patch -Np1 -i "${srcdir}/doc-use-local-fits.patch"
#   sed -e '/ignore:distutils/a \	ignore:"order" was deprecated in version 0.9' \
#       -e "/ignore:distutils/a \	ignore:The default kernel will change from 'Hann' to  'Gaussian'" \
#       -e "/ignore:distutils/a \	ignore:The default boundary mode will change from 'ignore' to  'strict'" \
#       -i setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
#   svn export https://github.com/sunpy/ndcube/trunk/changelog
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" #-vv --color=yes
}

package_python-ndcube() {
    depends=('python>=3.8' 'python-gwcs>=0.15')
    optdepends=('python-matplotlib>=3.2: plotting'
                'python-mpl-animators>=1.0: plotting'
                'python-reproject>=0.7.1: reproject'
                'python-ndcube-doc: Documentation for ndcube')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" {LICENSE.rst,licenses/*}
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-ndcube-doc() {
    pkgdesc="Documentation for Python ndcube module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../{LICENSE.rst,licenses/*}
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
