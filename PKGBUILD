# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>

_gitname=mpop

pkgname=python2-mpop
pkgrel=1
pkgver=v0.11.0.747.g2ad1bb6
pkgdesc="Meteorological Post-Processing Package (MPoP)"
arch=('any')
url="https://mpop.readthedocs.org/"
license=('LGPL3')
depends=(python2-mipp pyresample python2-pyspectral 
         python2-pyorbital python2-netcdf4 python2-h5py)
makedepends=('git')
source=(git://github.com/mraspaud/$_gitname.git)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  # We enforce this to be a strictly python2 package
  sed -i -e "s|^#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|^#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|^#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
         $(find ${srcdir} -name '*.py')
  python2 setup.py build_ext --inplace
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir" --optimize=1
  mv $pkgdir/usr/etc $pkgdir/etc
}

# vim:set ts=2 sw=2 et:
