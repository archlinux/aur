# Maintainer: Rich Lindsley <richli.ff at gmail dot com>
pkgname=python2-bufr
_py_pkgname=python-bufr # The pypi package name
pkgver=9bce29b
_py_pkgver="0.2-5" # the official version has a hyphen
pkgrel=1
pkgdesc="Generic Python BUFR file reader based on ECMWF BUFR library"
arch=('i686' 'x86_64')
url="https://github.com/pytroll/python-bufr"
license=('GPL3')
depends=('python2')
makedepends=('git' 'python2-numpy' 'eccodes')
options=(!emptydirs)
source=(git://github.com/pytroll/python-bufr.git patch.numpy)
md5sums=('SKIP'
         '0f451c84f573da6e902bba627db1c6fc')

pkgver() {
  cd $srcdir/$_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_py_pkgname/bufr"
  patch -p2 -i $srcdir/patch.numpy

  # We enforce this to be a strictly python2 package
  sed -i -e "s|^#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|^#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|^#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
         $(find ${srcdir} -name '*.py')
  sed -i setup.py -e 's/libraries = \[\x27bufr/libraries = \[\x27eccodes/'
  python2 setup.py build
}

package() {
  cd "$srcdir/$_py_pkgname/bufr"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
