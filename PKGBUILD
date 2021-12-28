# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-astropy-header
_pyname=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc="Pytest plugin to add diagnostic information to the header of the test output"
arch=('any')
url="https://github.com/astropy/pytest-astropy-header"
license=('BSD')
depends=('python-pytest>=4.6')
makedepends=('python-setuptools-scm')
checkdepends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('66eaf720c56fb7b0b0b32308864d1b82')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname//-/_}*egg-info \
        build/lib/${_pyname//-/_}-${pkgver}-py${_pyver}.egg-info
    PYTHONPATH="build/lib" pytest || warning "Tests failed"
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
