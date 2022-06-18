# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgbase="python-keras-git"
pkgname=("python-keras-git" "python2-keras-git")
_pkgname="keras"
pkgver=1.2.0.r106.ge54d7951
pkgrel=1
pkgdesc="Theano-based Deep Learning library (convnets, recurrent neural networks, and more)"
arch=('i686' 'x86_64')
url="https://github.com/fchollet/keras"
license=('MIT')
makedepends=('git'
             'python' 'python-setuptools'
             'python2' 'python2-setuptools'
            )
source=("${_pkgname}::git+http://github.com/fchollet/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/"
  cp -a "${_pkgname}" "${_pkgname}-py2"
  cd "${_pkgname}"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python 2"
  cd "$srcdir/${_pkgname}-py2"
  python2 setup.py build

  msg "Building Python 3"
  cd "$srcdir/${_pkgname}"
  python setup.py build
}

package_python2-keras-git() {
  depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-theano' 'python2-h5py')
  provides=('python2-keras')
  conflicts=('python2-keras')
  cd "$srcdir/${_pkgname}-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

package_python-keras-git() {
  depends=('python' 'python-numpy' 'python-scipy' 'python-theano' 'python-h5py')
  provides=('python-keras')
  conflicts=('python-keras')
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

# vim:set ts=2 sw=2 et:
