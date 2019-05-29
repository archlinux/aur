# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgbase=python-numpy
pkgname=('python-numpy' 'python2-numpy')
pkgver=1.16.4
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
makedepends=('cblas' 'lapack' 'python' 'python2' 'python-setuptools' 'python2-setuptools'
             'gcc-fortran' 'python-nose' 'python2-nose' 'cython' 'cython2')
checkdepends=('python-pytest' 'python2-pytest')
options=('staticlibs')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz")
sha512sums=('c8437e01a8c6c37787a8bf52f26d1adb273a6bb8f709f3cd92b427c63a1f772f9b2285b46321f2bd1a60a572797223d801aaed0fc2782bcdc7cbe39cd8c34c69')

prepare() {
  cp -a numpy-$pkgver{,-py2}
  cd numpy-$pkgver-py2

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "$srcdir"/numpy-$pkgver
  python setup.py build

  cd "$srcdir"/numpy-$pkgver-py2
  python2 setup.py build
}

check() {
  # TODO: Fix fortran tests here (it works fine after installation)

  cd "$srcdir"/numpy-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python3.7/site-packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'

  cd "$srcdir"/numpy-$pkgver-py2
  python2 setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python2.7/site-packages:$PYTHONPATH" python2 -c 'import numpy; numpy.test()'
}

package_python-numpy() {
  depends=('cblas' 'lapack' 'python')
  optdepends=('python-nose: testsuite'
              'openblas: faster linear algebra')

  cd numpy-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"
}

package_python2-numpy() {
  depends=('cblas' 'lapack' 'python2')
  optdepends=('python2-nose: testsuite'
              'openblas: faster linear algebra')

  cd numpy-$pkgver-py2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-numpy/"

  mv "$pkgdir"/usr/bin/f2py{,2}
}
