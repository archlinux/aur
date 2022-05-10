# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ndcube
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.0.2
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
             'python-matplotlib'
             'python-mpl-animators'
             'python-pytest-doctestplus'
             'graphviz'
             'subversion')
checkdepends=('python-pytest' 'python-reproject' 'python-sunpy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a042518ca2c97ccc61de8f7fc8150ce0')

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

    pytest || warning "Tests failed"
}

package_python-ndcube() {
    depends=('python>=3.7' 'python-gwcs>=0.15')
    optdepends=('python-matplotlib>=3.2: plotting'
                'python-mpl-animators>=1.0: plotting'
                'python-reproject: reproject'
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
