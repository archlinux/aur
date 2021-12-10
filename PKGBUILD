# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pytest-doctestplus
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.11.2
pkgrel=1
pkgdesc="Pytest plugin that provides advanced features for testing example code in documentation"
arch=('any')
url="https://github.com/astropy/pytest-doctestplus"
license=('BSD')
makedepends=('python-setuptools-scm')
#'python-sphinx')
checkdepends=('python-pytest-remotedata')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('0722247b329b08ce2084534e185b66a5')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   cd ${srcdir}/${_pyname}-${pkgver}/tests
#   PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py${_pyver}.egg-info
    PYTHONPATH="build/lib" pytest || warning "Tests failed"
}

package_python-pytest-doctestplus() {
    depends=('python-pytest>=4.6' 'python-setuptools>=30.3.0' 'python-packaging>=17.0')
#   optdepends=('python-pytest-doctestplus-doc: Documentation for pytest-doctestplus')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-pytest-doctestplus-doc() {
#    pkgdesc="Documentation for pytes-doctestplus"
#    cd ${srcdir}/${_pyname}-${pkgver}/tests/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
