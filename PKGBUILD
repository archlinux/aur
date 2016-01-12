# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>
# Contributor: Huguenin Loïs <huguenindl at gmail dot com>

pkgname=oqapy
pkgver=2.3.0
pkgrel=2
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
)
source=(
http://www.oqapy.eu/releases/$pkgname-$pkgver.tar.gz
Makefile.patch
)
sha256sums=('6c978f21c02cbd24a53bd38bbf21179c5ee4e5c946accda32f2ae3f9bc4b74f7'
            '5faffa555c37b8c991434b5fc8ece0a99805ae2783101da15e62a37fba75cd22')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  pushd lib/src
  sh ./build.sh
  popd

  pushd lib/sip
  python2 configure.py
  patch -p1 -i "$srcdir"/Makefile.patch
  make
}
package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -dm755 "$pkgdir"/usr/bin
  install -dm755 "$pkgdir"/usr/lib
  install -dm755 "$pkgdir"/usr/share/$pkgname
  install -dm755 "$pkgdir"/usr/share/pixmaps
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/share/man/man1

  mv oqapy.1 "$pkgdir"/usr/share/man/man1
  mv *.desktop "$pkgdir"/usr/share/applications/
  mv locale/ "$pkgdir"/usr/share
  mv medias/oqapy_ic_48.png "$pkgdir"/usr/share/pixmaps/
  mv $pkgname "$pkgdir"/usr/bin/

  mv lib/src/liboqapy-iproc.so "$pkgdir"/usr/lib
  pushd lib/sip
  make DESTDIR=$pkgdir install
  popd
  rm -rf lib

  cp -r . $pkgdir/usr/share/$pkgname/

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
  -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
  -e "s|\"python\"|\"python2\"|" \
  $(find $pkgdir -name "$pkgname.py" -or -name "$pkgname" -and -perm -o+rx -type f)
  chmod 0644 "$pkgdir"/usr/share/oqapy/medias/No_Preview_200x150.jpg
}
