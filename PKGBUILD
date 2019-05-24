# Maintainer: Andrew Sun <adsun701@gmail.com>

_name=simplekv
pkgbase=python-simplekv
pkgname=('python2-simplekv' 'python-simplekv')
pkgver=0.12.0
pkgrel=1
pkgdesc="A simple key-value store for binary data"
arch=('any')
url="https://github.com/mbr/simplekv"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('3ca3db6a35482c2cc3b763e33a7b8816e20a35de01c1063ece631cee3de277932291657e20d2e653434efa0c5a037c43ff4ac8362550220b5735ef8a3ad50aac')


prepare() {
  cp -a "${srcdir}/${_name}-${pkgver}"{,-py2}

  cd "${srcdir}/${_name}-${pkgver}-py2"
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find . -name '*.py')
}

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 setup.py build
}

package_python2-simplekv() {
depends=('python2')

  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-simplekv() {
depends=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
