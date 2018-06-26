# $Id: PKGBUILD 114894 2014-07-04 15:29:05Z fyan $
# Maintainer: Chris Brannon <chris@the-brannons.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

_pyname=flup
pkgbase=python-${_pyname}
pkgname=("python2-${_pyname}" "python-${_pyname}")
pkgver=1.0.3
pkgrel=1
pkgdesc='A collection of Python WSGI modules'
arch=('any')
url='https://www.saddi.com/software/flup/'
license=('MIT')
makedepends=('python2-distribute' 'python-distribute')
checkdepends=('python-pytest' 'python2-pytest')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'LICENSE')
md5sums=('a64e7a6374e043480ee92534c735964e'
         '2b61db5f66aad3b1748085e146603bd1')

prepare() {
  rm -rf -- "${srcdir}/${_pyname}-${pkgver}-py2"
  cp -a -- "${srcdir}/${_pyname}-${pkgver}"{,-py2}

  cd "$srcdir/${_pyname}-$pkgver-py2"
  # python2 fix
  for file in ${_pyname}/server/*.py; do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done
}


build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py build
}

package_python-flup() {
  depends=('python')
  cd "$srcdir/${_pyname}-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-flup() {
  depends=('python2')
  cd "$srcdir/${_pyname}-$pkgver-py2"

  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
