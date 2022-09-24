# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ndcube
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.0.3
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
             'python-sunpy-sphinx-theme'
             'python-gwcs'
             'python-mpl-animators'
             'python-pytest-doctestplus'
             'graphviz'
             'subversion')  # matplotlib <- mpl-animators
checkdepends=('python-reproject' 'python-sunpy')  # pytest-doctestplus gwcs mpl-animators already in makedep
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('84cd91f9977db35fb95c65f3e4def477')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    sed -e '/ignore:distutils/a \	ignore:"order" was deprecated in version 0.9' \
#        -e "/ignore:distutils/a \	ignore:The default kernel will change from 'Hann' to  'Gaussian'" \
#        -e "/ignore:distutils/a \	ignore:The default boundary mode will change from 'ignore' to  'strict'" \
#        -i setup.cfg
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    svn export https://github.com/sunpy/ndcube/trunk/changelog
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"  #-vv --color=yes
}

package_python-ndcube() {
    depends=('python>=3.8' 'python-gwcs>=0.15')
    optdepends=('python-matplotlib>=3.2: plotting'
                'python-mpl-animators>=1.0: plotting'
                'python-reproject<0.10: reproject'
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
