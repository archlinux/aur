# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ndcube
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.0.0
pkgrel=1
pkgdesc="Package for multi-dimensional contiguious and non-contiguious coordinate aware arrays"
arch=('any')
url="https://docs.sunpy.org/projects/ndcube"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-sphinx-automodapi' 'python-sphinx-changelog' 'python-sunpy-sphinx-theme' 'python-gwcs' 'python-matplotlib' 'python-mpl-animators' 'python-pytest-doctestplus' 'graphviz')
checkdepends=('python-pytest' 'python-reproject' 'python-sunpy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('74c36758d2b54f582405617c56a5702a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../build/lib" make html
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-ndcube() {
    depends=('python>=3.7' 'python-gwcs>=0.15')
    optdepends=('python-matplotlib>=3: plotting'
                'python-mpl-animators: plotting'
                'python-reproject: reproject'
                'python-ndcube-doc: Documentation for ndcube')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" {LICENSE.rst,licenses/*}
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-ndcube-doc() {
    pkgdesc="Documentation for Python ndcube module"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../{LICENSE.rst,licenses/*}
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
