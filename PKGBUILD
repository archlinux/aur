# Maintainer: Martin C. Doege <mdoege at compuserve dot com>

pkgname=morinus
pkgver=6.2
pkgrel=5
pkgdesc="Astrology software in wxPython"
url="https://sites.google.com/site/pymorinus/"
license=("GPL3")
install=${pkgname}.install
depends=(wxpython python2-imaging)
arch=(i686 x86_64)
source=("https://sites.google.com/site/pymorinus/Home/Morinus.zip"
        'morinus.patch'
        'options.patch'
        'placedb.patch'
        'addicon.patch'
        'morinus-portrait.png'
        'morinus.desktop'
        )
md5sums=('48b46dcf208d3099ab7e7a12fae30d55'
         'b49217822e54ca07f54c59381a857574'
         'eb443f82da4cf176aa6bbc7c9a08fd1a'
         '0d9894dae21c06c167fc5a321e3ccdc0'
         'b9d737b537a18c1e66b775dafd878fed'
         '4140ef94ff63a7b650e98fedc165945f'
         'd5325556826e5a3bf1cd65c71f645576')

build() {
  cd $srcdir/Morinus/SWEP/src/
  python2 setup.py build
  cp build/lib.linux-$CARCH-2.7/sweastrology.so $srcdir/Morinus/
  cd $srcdir/Morinus/
  rm -r SWEP/src Images Opts
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/Morinus/morinus.py $pkgdir/usr/bin/morinus
  rm $srcdir/Morinus/morinus.py
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/$pkgname
  patch $srcdir/Morinus/options.py $srcdir/../options.patch
  patch $srcdir/Morinus/placedb.py $srcdir/../placedb.patch
  patch $srcdir/Morinus/morin.py $srcdir/../addicon.patch
  sed -i 's/import Image/from PIL import Image/g' $srcdir/Morinus/*.py
  cp -pr $srcdir/Morinus/* $pkgdir/usr/lib/python2.7/site-packages/$pkgname/
  patch $pkgdir/usr/bin/morinus $srcdir/../morinus.patch
  touch $pkgdir/usr/lib/python2.7/site-packages/morinus/__init__.py
  chmod 755 $pkgdir/usr/bin/morinus
  mkdir -p "$pkgdir/usr/share/"{applications,icons}
  cp "$srcdir/morinus.desktop" "$pkgdir/usr/share/applications"
  cp "$srcdir/morinus-portrait.png" "$pkgdir/usr/share/icons"
  }
