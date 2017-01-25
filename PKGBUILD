# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=('pypy3-cython' 'pypy-cython')
pkgbase=pypy-cython
pkgver=0.25.2
pkgrel=1
pkgdesc="C-Extensions for PyPy"
arch=('i686' 'x86_64')
url="http://www.cython.org"
license=('APACHE')
makedepends=('pypy3' 'pypy')
source=("https://pypi.python.org/packages/b7/67/7e2a817f9e9c773ee3995c1e15204f5d01c8da71882016cac10342ef031b/Cython-$pkgver.tar.gz")
md5sums=('642c81285e1bb833b14ab3f439964086')

build() {
  cd "$srcdir"
  cp -a "Cython-$pkgver" "Cython-pypy3"
  mv "Cython-$pkgver" "Cython-pypy"
}

package_pypy3-cython() {
  depends=('pypy3')

  cd "$srcdir/Cython-pypy3"
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

  cd "$srcdir/Cython-pypy"
  pypy setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir/usr"
  mv "$pkgdir/opt/pypy/bin" "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"

  sed -i 's|#!.*python|#!/usr/bin/pypy|' *
  for i in cython cythonize cygdb; do
    mv $i $i-pypy
  done
}
