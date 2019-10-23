# Maintainer: con-f-use <con-f-use@gmx.net>
# Maintainer: Tod Jackson <tod.jackson@gmail.com>
pkgname=comix
pkgver=4.0.4
pkgrel=5
epoch=
pkgdesc="A user-friendly, customizable comic/image viewer"
arch=('any')
url="https://sourceforge.net/projects/comix"
license=('GPL2')
depends=('unrar' 'python2-pillow' 'pygtk')
makedepends=('tar' 'pygtk' 'python2-pillow')
optdepends=('gconf')
conflicts=('mcomix')
source=("https://downloads.sourceforge.net/project/comix/comix/comix-4.0.4/comix-4.0.4.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcomix%2Ffiles%2F")
md5sums=('029227a77b122f7080ee0280d41bee78')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/src"
  sed -i 's/import Image/from PIL import Image/g' thumbbar.py histogram.py image.py library.py thumbnail.py thumbremover.py comix.py ../mime/comicthumb ../install.py
  # Hack out the check for PIL version
  sed -i 's~#!/usr/bin/env python~#!/usr/bin/env python2~g' comix.py ../mime/comicthumb ../install.py
  # https://github.com/python-pillow/Pillow/blob/master/docs/deprecations.rst#version-constant
  sed -i 's/assert Image.V/#assert Image.V/' ../src/comix.py
  sed -i 's/assert Image.V/#assert Image.V/' ../install.py
  # Fix thumbnail page numbers
  sed -i 's/image.tostring/image.tobytes/' ../src/comix.py
  sed -i 's/image.tostring/image.tobytes/' ../src/image.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/"
  python2 install.py install --dir "$pkgdir/usr/"
  # File conflicts
  rm -rf "$pkgdir/usr/share/mime/"
  mkdir -p "$pkgdir/usr/share/mime/packages/"
  cp "mime/comix.xml" "$pkgdir/usr/share/mime/packages/"
}
