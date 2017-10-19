# Maintainer: twa022 <twa022 at gmail dot com>

_pkgbase=PyBrowserID
pkgbase=python-pybrowserid
pkgname=('python2-pybrowserid' 'python-pybrowserid')
pkgver=0.12.0
pkgrel=1
pkgdesc="low-level library for implementing MAC Access Authentication"
arch=('any')
license=('MPL2')
url="https://github.com/mozilla/pybrowserid"
makedepends=('python' 'python2' 'python-requests' 'python2-requests' 'python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mozilla/PyBrowserID/archive/$pkgver.tar.gz")
sha256sums=('a065f0ed51d647d65ea651e30499a79c4ee6f1d040851400c0e9743160a2c731')

prepare() {
  cp -a "${_pkgbase}-${pkgver}" "${_pkgbase}-${pkgver}-py2" 
  cd "${_pkgbase}-${pkgver}-py2" 
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  echo "Building Python2"
  cd "${_pkgbase}-${pkgver}-py2" 
  python2 setup.py build

  echo "Building Python3"
  cd ../"${_pkgbase}-${pkgver}"
  python setup.py build
}

package_python2-pybrowserid() {
  depends=('python2-requests')

  cd "${_pkgbase}-${pkgver}-py2" 
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python-pybrowserid() {
  depends=('python-requests')

  cd "${_pkgbase}-${pkgver}" 
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
