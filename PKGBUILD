# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>

_gitname=pyspectral

pkgname=python2-pyspectral
pkgrel=2
pkgver=210b386
pkgdesc="Passive sensor on a meteorological satellite relative spectral response"
arch=('any')
url="https://pyspectral.readthedocs.org/"
license=('MIT')
depends=('python2')
makedepends=('git')
source=(git://github.com/adybbroe/$_gitname.git)
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
  mkdir -p $pkgdir/usr/share/licenses/python2-pyspectral
  cp LICENSE $pkgdir/usr/share/licenses/python2-pyspectral
}

# vim:set ts=2 sw=2 et:
