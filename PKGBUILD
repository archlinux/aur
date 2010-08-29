# $Id: PKGBUILD,v 1.20 2009/01/26 17:07:33 angvp Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.4.1
pkgrel=2
pkgdesc="Scientific tools for Python"
arch=('i686' 'x86_64')
license=('custom')
url="http://numpy.scipy.org/"
depends=('lapack' 'python2')
makedepends=('python-nose' 'gcc-fortran')
optdepends=('python-nose: test suite')
source=(http://downloads.sourceforge.net/numpy/numpy-${pkgver}.tar.gz)
md5sums=('5c7b5349dc3161763f7f366ceb96516b')

build() {
  cd "${srcdir}/numpy-${pkgver}"
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"
  python2 setup.py config_fc --fcompiler=gnu95 build || return 1
}

package() {
  cd "${srcdir}/numpy-${pkgver}"
  python2 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" || return 1
  sed -i 's@env python@env python2@' "${pkgdir}"/usr/lib/python2.7/site-packages/numpy/{*.py,*/*.py,*/*/*.py,*/*/*/*.py}
  sed -i 's@/usr/bin/python@/usr/bin/python2@' "${pkgdir}"/usr/lib/python2.7/site-packages/numpy/distutils/{from,conv}_template.py
  sed -i 's@#! python@#!/usr/bin/python2@' "${pkgdir}"/usr/lib/python2.7/site-packages/numpy/ma/bench.py

  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}
