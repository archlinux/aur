# $Id: PKGBUILD 198398 2016-12-07 19:41:34Z bgyorgy $
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=screenlets-pack-basic
_pkgname=indiv-screenlets
pkgver=0.1.6
pkgrel=3
pkgdesc="Desktop widgets for Screenlets"
arch=('any')
url="https://launchpad.net/indiv-screenlets"
license=('GPL3')
depends=('screenlets')
makedepends=('dos2unix')
optdepends=('python2-feedparser: Clear Rss Screenlet'
            'python2-pytz: Freemeteo Weather Screenlet'
            'python2-pillow: Lipik, Lyrics Screenlets'
            'python2-numpy: Lipik Screenlet')
source=(https://launchpad.net/indiv-screenlets/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.bz2{,.asc}
        drop-gnomevfs.patch
        screenlets-pack-basic-pillow.patch)
validpgpkeys=('D82D1D02396B27DC5045E356A01AFB1B15E8CCA4') # Guido Tabbernuk
md5sums=('d908308a60eecbee13a21917d36b10bc'
         'SKIP'
         '0ee366b0eafea6b646a7a5f02df2a65c'
         '4e30b2ad949e05f2a32770c95f95cd8f')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Remove python2-gnomevfs dependency
  # https://code.launchpad.net/~ballogy/indiv-screenlets/lyrics-replace-gnomevfs/+merge/104175
  patch -Np1 -i "$srcdir/drop-gnomevfs.patch"

  # Port to Pillow
  patch -Np1 -i "$srcdir/screenlets-pack-basic-pillow.patch"

  # Some files are distributed in DOS format...
  find . -name \*.py -exec dos2unix -q '{}' \;

  # Python2 fix
  find . -name \*.py -exec sed -i 's@^#.*python$@#!/usr/bin/python2@' '{}' \;
  sed -i 's@^#.*python$@#!/usr/bin/python2@' src/Lyrics/gui/{ls_widget,afv_widgets}
  sed -i 's/python -u/python2 -u/' setup.py

  # Fix desktop files
  sed -i 's/desktop_file % (podir, packname, podir, podir)/desktop_file % (podir, normal_packname, podir, podir)/' setup.py
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1

  # Remove screenlets-pack-all, because a lot of them are broken
  rm "$pkgdir"/usr/lib/python2.7/site-packages/screenlets_pack_all-$pkgver-py2.7.egg-info
  rm -r "$pkgdir"/usr/share/applications/screenlets_pack_all
  rm -r "$pkgdir"/usr/share/screenlets/screenlets-pack-all
}
