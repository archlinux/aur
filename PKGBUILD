# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.5.0
pkgrel=2
pkgdesc="Scientific tools for Python"
arch=('i686' 'x86_64')
license=('custom')
url="http://numpy.scipy.org/"
depends=('lapack' 'python2')
makedepends=('python-nose' 'gcc-fortran')
optdepends=('python-nose: test suite')
source=(http://downloads.sourceforge.net/numpy/numpy-${pkgver}.tar.gz)
md5sums=('3a8bfdc434df782d647161c48943ee09')

build() {
  cd "${srcdir}/numpy-${pkgver}"

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"
  python2 setup.py config_fc --fcompiler=gnu95 build
}

package() {
  cd "${srcdir}/numpy-${pkgver}"
  python2 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}"

  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
             -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
             $(find $pkgdir -name '*.py')
}
