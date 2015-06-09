# Maintainer: Martin C. Doege <mdoege at compuserve dot com>

pkgname=morinustrad
pkgver=6.2
pkgrel=6
pkgdesc="Software for traditional astrology in wxPython"
url="https://sites.google.com/site/tradmorinus/morinus"
license=("GPL3")
install=${pkgname}.install
depends=(wxpython python2-imaging)
arch=(i686 x86_64)
source=("https://sites.google.com/site/tradmorinus/morinus/Morinus.zip"
        'morinus.patch'
        'options.patch'
        'placedb.patch'
        'addicon.patch'
        'morinus-portrait-bw.png'
        'morinustrad.desktop'
        )
md5sums=('0c910c8dea994a1967251bca1e704712'
         '3ddfbe09219d79fd0c9bf5b1cf07a95f'
         '572e4f8dfe4b91e37973915f63ee6098'
         '9fc85211a841fa3a5a9c57891c28e429'
         'b8b578d9f4bc3b79b9715992ebb0e101'
         'd88ce0420453dda75aa4c6404b4c604f'
         '08f8c2045e5318b2d824d29cd18b053f')

build() {
  cd $srcdir/Morinus/SWEP/src/
  python2 setup.py build
  cp build/lib.linux-$CARCH-2.7/sweastrology.so $srcdir/Morinus/
  cd $srcdir/Morinus/
  rm -r SWEP/src Images Opts
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/Morinus/morinus.py $pkgdir/usr/bin/$pkgname
  rm $srcdir/Morinus/morinus.py
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/$pkgname
  patch $srcdir/Morinus/options.py $srcdir/../options.patch
  patch $srcdir/Morinus/placedb.py $srcdir/../placedb.patch
  patch $srcdir/Morinus/morin.py $srcdir/../addicon.patch
  sed -i 's/import Image/from PIL import Image/g' $srcdir/Morinus/*.py
  chmod 755 SWEP SWEP/Ephem Hors Res
  cp -pr $srcdir/Morinus/* $pkgdir/usr/lib/python2.7/site-packages/$pkgname/
  patch $pkgdir/usr/bin/$pkgname $srcdir/../morinus.patch
  touch $pkgdir/usr/lib/python2.7/site-packages/$pkgname/__init__.py
  chmod 755 $pkgdir/usr/bin/$pkgname
  mkdir -p "$pkgdir/usr/share/"{applications,icons}
  cp "$srcdir/morinustrad.desktop" "$pkgdir/usr/share/applications"
  cp "$srcdir/morinus-portrait-bw.png" "$pkgdir/usr/share/icons"
  }
