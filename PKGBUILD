# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgbase=python-snowboy
_pkgname=snowboy
pkgname=('python-snowboy' 'python2-snowboy')
pkgver=1.3.0
pkgrel=1
pkgdesc="A hotword detection engine - Python bindings"
arch=('x86_64')
url="https://snowboy.kitt.ai/"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'swig' 'cblas')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Kitt-AI/snowboy/archive/v${pkgver}.tar.gz")
sha512sums=('3edd3038c11beb9ecc9a7f73f91c7097ec869841eade6715df061987313cdad60d7090d494f3d161bf64c921d5f75e8f64a2befc6bf7202b468f0122c7ecff1a')
validpgpkeys=('') # TODO https://github.com/Kitt-AI/snowboy/issues/375

prepare() {
    # TODO https://github.com/Kitt-AI/snowboy/issues/377
    # TODO https://github.com/Kitt-AI/snowboy/pull/376
    sed -i -e "s|-lf77blas -lcblas -llapack -latlas|-lcblas|g" \
        -e 's/ -shared/ -Wl,-O1,--as-needed\0/g' \
        "${srcdir}/${_pkgname}-${pkgver}/swig/Python3/Makefile"
    sed -i -e "s|-lf77blas -lcblas -llapack -latlas|-lcblas|g" \
        -e 's/ -shared/ -Wl,-O1,--as-needed\0/g' \
        "${srcdir}/${_pkgname}-${pkgver}/swig/Python/Makefile"
    cp -a "${srcdir}/${_pkgname}-${pkgver}"{,-py2}
}

build() {
    # TODO compile lib/ubuntu64/libsnowboy-detect.a manually?
    # https://github.com/Kitt-AI/snowboy/issues/99#issuecomment-367620930

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py build
}

package_python-snowboy() {
    depends=('python' 'cblas' 'python-pyaudio')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-snowboy() {
    depends=('python2' 'cblas' 'python-pyaudio')

    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
