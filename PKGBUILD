# Maintainer: Rich Lindsley <rich at dranek dot com>

_gitname=pyresample

pkgname=pyresample
pkgrel=1
pkgver=v1.8.3
pkgdesc="Geospatial image resampling in Python"
arch=('any')
url="http://pyresample.readthedocs.org"
depends=('python2-numpy' 'python2-pyproj' 'python2-configobj')
optdepends=('python2-numexpr: used to optimize some bottlenecks')
makedepends=('git')
options=(!emptydirs)
license=('LGPL3')
source=(git://github.com/pytroll/$_gitname.git)
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
}

# vim:set ts=2 sw=2 et:
