# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-baseband
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=3.2.1
pkgrel=1
pkgdesc="Package to read and write radio baseband data"
arch=('i686' 'x86_64')
url="https://baseband.readthedocs.io"
license=('GPL')
makedepends=('python-setuptools' 'python-astropy' 'python-sphinx-astropy' 'graphviz')
checkdepends=('python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('beae9de373abf398b7d7d93a88866b74')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest
}

package_python-baseband() {
    depends=('python-numpy>=1.10' 'python-astropy>=4.0')
    optdepends=('python-baseband-doc: Documentation for Baseband')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-baseband-doc() {
    pkgdesc="Documentation for Python Baseband"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
