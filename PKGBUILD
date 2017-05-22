# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=python2-pycoast
_gitname=pycoast
pkgver="0.6.1"
pkgrel=1
pkgdesc="Writing of coastlines, borders and rivers to images in Python"
arch=('any')
url="https://pypi.python.org/pypi/pycoast"
license=('GPL3')
depends=('python2')
options=(!emptydirs)
makedepends=('git')
source=(git://github.com/pytroll/$_gitname.git
        http://www.soest.hawaii.edu/pwessel/gshhg/gshhg-shp-2.3.6.zip)
md5sums=('SKIP'
         'f2ab44f82d31edbe67e9651216695372')

build() {
  cd "$srcdir/$_gitname"
  sed -i pycoast/__init__.py \
    -e 's/import ImageDraw/from PIL import ImageDraw/' \
    -e 's! db_root_path)! db_root_path="/usr/share/pycoast")!' 
  # We enforce this to be a strictly python2 package
  sed -i -e "s|^#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|^#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|^#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
         $(find ${srcdir} -name '*.py')
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p $pkgdir/usr/share/pycoast
  cp -r $srcdir/GSHHS_shp $srcdir/WDBII_shp $pkgdir/usr/share/pycoast
  find $pkgdir/usr/share/pycoast -type d -exec chmod 755 {} \;
  find $pkgdir/usr/share/pycoast -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
