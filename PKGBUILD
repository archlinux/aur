# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgbase=python-numpy
pkgname=('python2-numpy' 'python-numpy')
pkgver=1.7.0
_pkgver=1.7.0b2
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('i686' 'x86_64')
license=('custom')
url="http://numpy.scipy.org/"
makedepends=('lapack' 'python' 'python2' 'python-distribute' 'python2-distribute' 'gcc-fortran' 'python-nose')
source=(http://downloads.sourceforge.net/numpy/numpy-${_pkgver}.tar.gz)
md5sums=('1b62cf0e34e2db58b0241b00d603df24')

build() {
  cd "${srcdir}"
  cp -a numpy-${_pkgver} numpy-py2-${_pkgver}

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  cd "${srcdir}/numpy-py2-${_pkgver}"
  python2 setup.py config_fc --fcompiler=gnu95 build

  echo "Building Python3"
  cd "${srcdir}/numpy-${_pkgver}"
  python setup.py config_fc --fcompiler=gnu95 build
}

package_python2-numpy() {
  depends=('lapack' 'python2')
  optdepends=('python-nose: testsuite')

  cd "${srcdir}/numpy-py2-${_pkgver}"
  python2 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-numpy/"

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
             $(find ${pkgdir} -name '*.py')
}

package_python-numpy() {
  depends=('lapack' 'python')
  provides=("python3-numpy=${pkgver}")
  replaces=('python3-numpy')
  conflicts=('python3-numpy')

  cd "${srcdir}/numpy-${_pkgver}"
  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python3-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python3-numpy/"
}
