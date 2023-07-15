# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
pkgname=python2-numpy
pkgver=1.16.6
pkgrel=3
pkgdesc="Scientific tools for Python 2"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python2')
optdepends=('blas-openblas: faster linear algebra')
makedepends=('python2-setuptools' 'gcc-fortran' 'cython2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz")
sha512sums=('27344ae10c7e7fd222b34d1514aaccbb62d1322cc79bec28f5c1e8741eefbb6bc7664055e49ed4f08d5716ca93d4c997fb98bee26a19957543ab4f8c15cd41f7')

prepare() {
  cd numpy-$pkgver
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd numpy-$pkgver
  CFLAGS+=" -ffat-lto-objects" \
  python2 setup.py build
}

package() {
  cd numpy-$pkgver
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/python2-numpy/"

  mv "$pkgdir"/usr/bin/f2py{,2}
}
