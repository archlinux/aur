# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=('pypy3-cython' 'pypy-cython')
pkgbase=pypy-cython
pkgver=0.29.30
pkgrel=1
pkgdesc="C-Extensions for PyPy"
arch=('i686' 'x86_64')
url="http://www.cython.org"
license=('APACHE')
makedepends=('pypy3' 'pypy')
source=(https://github.com/cython/cython/archive/$pkgver/cpython-$pkgver.tar.gz)

md5sums=('21609cfd0e5fe9c92da6849e27d3cf80')

build() {
  cd "$srcdir"
  cp -a "cython-$pkgver" "cython-pypy3"
  mv "cython-$pkgver" "cython-pypy"
}

package_pypy3-cython() {
  depends=('pypy3')

  cd "$srcdir/cython-pypy3"
  pypy3 setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir/usr"
  mv "$pkgdir/opt/pypy3/bin" "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"

  sed -i 's|#!.*python|#!/usr/bin/pypy3|' *
  for i in cython cythonize cygdb; do
    mv $i $i-pypy3
  done
}

package_pypy-cython() {
  depends=('pypy')

  cd "$srcdir/cython-pypy"
  pypy setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir/usr"
  mv "$pkgdir/opt/pypy/bin" "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"

  sed -i 's|#!.*python|#!/usr/bin/pypy|' *
  for i in cython cythonize cygdb; do
    mv $i $i-pypy
  done
}
