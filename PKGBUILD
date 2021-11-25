# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-specutils
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.5.0
pkgrel=1
pkgdesc="Astropy Affiliated package for 1D spectral operations"
arch=('i686' 'x86_64')
url="http://specutils.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-sphinx-astropy' 'python-gwcs' 'python-ndcube>=2.0' 'python-mpl-animators' 'graphviz')
#checkdepends=('python-pytest-doctestplus')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('af883f8fa36a2e55d4e24284cbde7dcd')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    PYTHONPATH="build/lib" pytest "build/lib" #|| warning "Tests failed"
#}

package_python-specutils() {
    depends=('python>=3.7' 'python-scipy' 'python-gwcs>=0.17.0' 'python-ndcube')
    optdepends=('python-specutils-doc: Documentation for Specutils'
                'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-specutils-doc() {
    pkgdesc="Documentation for Python Specutils module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
