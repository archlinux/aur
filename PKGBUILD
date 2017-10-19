# Maintainer: twa022 <twa022 at gmail dot com>

_pkgbase=PyFxA
pkgbase=python-pyfxa
pkgname=('python2-pyfxa' 'python-pyfxa')
pkgver=0.4.0
pkgrel=1
pkgdesc="Python library for interacting with the Firefox Accounts ecosystem"
arch=('i686' 'x86_64')
license=('MPL2')
url="https://github.com/mozilla/PyFxA"
makedepends=('python2-six' 'python2-hawkauthlib' 'python2-pybrowserid' 'python2-cryptography' 'python2-setuptools'
             'python-six' 'python-hawkauthlib' 'python-pybrowserid' 'python-cryptography' 'python-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mozilla/PyFxA/archive/v$pkgver.tar.gz")
sha256sums=('ad787dcf569214aad6d223a1261e432c87031f7cc9d65c2909d6705879cecc47')

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

package_python2-pyfxa() {
  depends=('python2-six' 'python2-hawkauthlib' 'python2-pybrowserid' 'python2-cryptography')

  cd "${_pkgbase}-${pkgver}-py2" 
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/fxa-client "${pkgdir}"/usr/bin/fxa-client-py2
}

package_python-pyfxa() {
  depends=('python-six' 'python-hawkauthlib' 'python-pybrowserid' 'python-cryptography')

  cd "${_pkgbase}-${pkgver}" 
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
