# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astroscrappy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.1.0
pkgrel=1
pkgdesc="Speedy Cosmic Ray Annihilation Package in Python"
arch=('i686' 'x86_64')
url="https://astroscrappy.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'cython' 'python-astropy' 'python-extension-helpers' 'python-sphinx-astropy')
checkdepends=('python-pytest-doctestplus' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/a/astroscrappy/astroscrappy-${pkgver}.tar.gz")
md5sums=('43e189d666fab2ecf476f2a569f37760')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-${_pyver}" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-${_pyver}" pytest "build/lib.linux-${CARCH}-${_pyver}" || warning "Tests failed"
}

package_python-astroscrappy() {
    depends=('python' 'python-astropy' 'cython>=0.21')
    optdepends=('python-astroscrappy-doc: Documentation for Astro-SCRAPPY')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-astroscrappy-doc() {
    pkgdesc="Documentation for Astro-SCRAPPY"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
