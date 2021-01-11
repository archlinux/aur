# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-astlib
_paname=${pkgbase#python-}
_pyname=astLib
pkgname=("python-${_paname}" "python-${_paname}-doc")
pkgver=0.11.4
pkgrel=1
pkgdesc="A set of Python modules that provides some tools for research astronomers"
arch=('i686' 'x86_64')
url="http://astlib.sourceforge.net"
license=('LGPL')
makedepends=('python-setuptools' 'wcstools-all' 'swig')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'use_system_wcstools.patch')
sha256sums=('d6a74e6e5562ab8e8a95045c4b7112bea1838b9d93d55d05841dc2057704198c'
            '0968f90d278c1044747a7f8648d61a2957d1e7a1238b8011bdadf083908e03cf')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/use_system_wcstools.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

package_python-astlib() {
    depends=('python-scipy' 'python-matplotlib' 'python-astropy' 'wcstools-all')
    optdepends=('python-astlib-doc: Documentation for astLib')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -a examples -t "${pkgdir}/usr/share/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --skip-build
}

package_python-astlib-doc() {
    pkgdesc="Documentation for astLib"
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgbase}/html" ${_pyname}/*
}
