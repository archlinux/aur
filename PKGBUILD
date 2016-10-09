# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=python2-pycoast
_py_pkgname=pycoast # The pypi package name
pkgver="0.5.5"
pkgrel=1
pkgdesc="Writing of coastlines, borders and rivers to images in Python"
arch=('any')
url="https://pypi.python.org/pypi/pycoast"
license=('GPL3')
depends=('python2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/7e/dc/d5ec745fe441729ed14f0fd8ebca7a67bf1b035358d52400dda362dd3d4d/pycoast-0.5.5.tar.gz
        http://www.soest.hawaii.edu/pwessel/gshhg/gshhg-shp-2.3.6.zip)

build() {
  cd "$srcdir/$_py_pkgname-$pkgver"
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
  cd "$srcdir/$_py_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p $pkgdir/usr/share/pycoast
  cp -r $srcdir/GSHHS_shp $srcdir/WDBII_shp $pkgdir/usr/share/pycoast
  find $pkgdir/usr/share/pycoast -type d -exec chmod 755 {} \;
  find $pkgdir/usr/share/pycoast -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
md5sums=('e0b6633538d0ff6c213ec63efae417eb'
         'f2ab44f82d31edbe67e9651216695372')
