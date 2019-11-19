# Maintainer: Universebenzene <universebenzene at sina dot com>
# Contributor: Miguel de Val-Borro <miguel.deval at gmail dot com>
_pyname=astropy-helpers
pkgbase=python-${_pyname}31
pkgname=("python-${_pyname}31" "python-${_pyname}31-doc")
pkgver=3.1.1
pkgrel=2
pkgdesc="Utilities used for building the Astropy python library for astronomy"
arch=('any')
url="https://astropy-helpers.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python-sphinx-astropy')
source=("https://github.com/astropy/astropy-helpers/archive/v${pkgver}.tar.gz"
        'use_system_astropy_helpers.patch')
md5sums=('69be038c5b31aa43b41470ec9e6e9f41'
         '387b23e088026915b59fb70eefb9b14e')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/use_system_astropy_helpers.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

package_python-astropy-helpers31() {
    optdepends=("python-astropy-helpers-doc=${pkgver}: Documentation for Astropy helpers")
    provides=("python-astropy-helpers=${pkgver}")
    conflicts=('python-astropy-helpers')
    cd ${srcdir}/${_pyname}-${pkgver}
    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-astropy-helpers31-doc() {
    pkgdesc="Documentation for Astropy helpers"
    provides=("python-astropy-helpers-doc=${pkgver}")
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
