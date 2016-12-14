# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>
# Contributor: Huguenin Loïs <huguenindl at gmail dot com>

pkgbase=oqapy
pkgname=($pkgbase{,-iproc} python-$pkgbase-iproc)
# pkgname=oqapy
pkgver=2.5.0
pkgrel=1
pkgdesc="An application intended to sort files of the image type in graphic mode."
arch=(i686 x86_64)
url="http://www.oqapy.eu/"
license=('GPL')
depends=(
python2-pyqt
python2-exiv2
python2-numpy
pyexiv2
gphoto2
dcraw
python2-imaging
opencv
opencv2-opt
)
source=(
http://www.oqapy.eu/releases/$pkgname-$pkgver.tar.gz
https://launchpad.net/oqapy/trunk/oqapy/+download/oqapy-iproc.0.1.0.tar.gz
oqapy.sh
https://launchpad.net/oqapy/trunk/oqapy/+download/python-oqapy-iproc.0.1.1.tar.gz
c_hist.patch
opencv.patch
)
sha256sums=('34904d957fb0d7e07d8cad620a1b5fc78207e7f7e8f8ac7eca24181a4b2eb902'
            '68842337327a1ecd062d2940d2bebc27fd27ca7448a9743dcc2cd6f8aec83cbc'
            '87b5f1c69c4ec9812366987372a3ab476b70e95b25cd03eb170b45ee0667f93a'
            '91e63ee25ef87587e47ca80e06c01c5d0967d042878210d17e0f30bc264f8c63'
            '5e560616a135302fecb275c16921ecd8b472607782c7334fdf6912d5545bacef'
            '5bcef10f039c0768c38f222e3f34023cafb0a90598767ac21dad7244e5b7656d')
prepare() {
  cd $srcdir/python-oqapy-iproc.0.1.1
  rm -f liboqapy-iproc.so
  patch -p1 -i $srcdir/opencv.patch
  patch -p1 -i $srcdir/c_hist.patch

  cd $srcdir/oqapy-iproc.0.1.0
  rm -f liboqapy-iproc.so
}
build(){
  msg2 "Building oqapy-iproc library"
  cd $srcdir/oqapy-iproc.0.1.0
  sh ./build.sh

  msg2 "Building oqapy-iproc python module"
  cd $srcdir/python-oqapy-iproc.0.1.1
  python2 configure.py
  sed -e "12 s#\$# -L$srcdir/oqapy-iproc.0.1.0#" -i Makefile
  make
}
package_oqapy-iproc() {
  cd $srcdir/oqapy-iproc.0.1.0
  install -Dm644 liboqapy-iproc.so $pkgdir/usr/lib/liboqapy-iproc.so
}
package_python-oqapy-iproc(){
  cd $srcdir/python-oqapy-iproc.0.1.1
  make DESTDIR=$pkgdir install
}
package_oqapy() {
  cd "$srcdir"/$pkgname-$pkgver

  install -dm755 "$pkgdir"/usr/bin
  install -dm755 "$pkgdir"/usr/share/oqapy
  install -dm755 "$pkgdir"/usr/share/pixmaps
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/share/man/man1

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
  -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
  -e "s|\"python\"|\"python2\"|" \
  $(find . -name "$pkgname.py" -or -name "$pkgname" -and -perm -o+rx -type f)
  cp -R ./ $pkgdir/usr/share/oqapy
  mv $pkgdir/usr/share/oqapy/oqapy.1 $pkgdir/usr/share/man/man1
  mv $pkgdir/usr/share/oqapy/oqapy.desktop  $pkgdir/usr/share/applications/
  install -Dm644 $pkgdir/usr/share/oqapy/medias/oqapy_ic_48.png \
    "$pkgdir"/usr/share/pixmaps/
  install -Dm755 $srcdir/oqapy.sh $pkgdir/usr/bin/oqapy
}
