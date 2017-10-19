# Maintainer: twa022 <twa022 at gmail dot com>

_pkgbase=hawkauthlib
pkgbase=python-hawkauthlib
pkgname=('python2-hawkauthlib' 'python-hawkauthlib')
pkgver=0.1.1
pkgrel=1
pkgdesc="low-level library for implementing MAC Access Authentication"
arch=('any')
license=('MPL2')
url="https://github.com/mozilla/hawkauthlib"
makedepends=('python' 'python2' 'python-webob' 'python2-webob' 'python-requests' 'python2-requests' 
             'python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mozilla-services/hawkauthlib/archive/v$pkgver.tar.gz")
sha256sums=('52ac35115afe9ae249f93e9bf0ce3cb418ed77dae964f586f53d33d38f9e6f10')

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

package_python2-hawkauthlib() {
  depends=('python2-webob' 'python2-requests')

  cd "${_pkgbase}-${pkgver}-py2" 
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python-hawkauthlib() {
  depends=('python-webob' 'python-requests')

  cd "${_pkgbase}-${pkgver}" 
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
