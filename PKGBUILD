# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgbase=python-numpy
pkgname=('python-numpy' 'python2-numpy')
pkgver=1.15.4
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="http://www.numpy.org/"
makedepends=('cblas' 'lapack' 'python' 'python2' 'python-setuptools' 'python2-setuptools' 'gcc-fortran'
             'python-nose' 'python2-nose' 'cython' 'cython2')
checkdepends=('python-pytest' 'python2-pytest')
options=('staticlibs')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz")
sha512sums=('2cb375b5cec4b9fbf6f65fb79eb81429af3e1e6aefa5e39cafeee7d9ecd8046647ccc97129170069e583327601b9cfba562be3720dc5cb2bdc2216ac6eb6d690')

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
}
