# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: zhuqin <zhuqin83@gmail.com>

pkgname=labyrinth
pkgver=0.6
pkgrel=4
pkgdesc="Lightweight mind-mapping tool with support for image import and drawing"
arch=('any')
url="https://github.com/labyrinth-team/labyrinth"
license=('GPL')
depends=('pygtk' 'python2-xdg')
source=($pkgname-$pkgver.tar.gz::https://github.com/labyrinth-team/$pkgname/archive/$pkgver.tar.gz
        no-numpy.patch
        optional-gconf.patch
        appdata.patch)
sha256sums=('c651ad0c6741e91251961107558d915dc7efbb57d84d64173ce0beed2a4aa34a'
            '67f5486d770253e8d9778795c2fe0b928a1a428e296f19b2760bf73114c340ce'
            'aeb07b467634dd199918209f6f575f1c33a3d2ca09620443c29442f6e02545f8'
            '44c9a9aaac2f62a3006fc5051924ad5a67aa9be76a6a30dff8dc8c2d78c2903a')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's@^#.*python$@#!/usr/bin/python2@' labyrinth_lib/*.py

  # Eliminate numpy dependency
  patch -Np1 -i ../no-numpy.patch

  # Make gconf dependency optional
  patch -Np1 -i ../optional-gconf.patch

  # Add appdata file
  patch -Np1 -i ../appdata.patch
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
  make -C po
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  make -C po localedir="$pkgdir/usr/share/locale" install
  install -Dm644 data/$pkgname-16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
  install -Dm644 data/$pkgname-22.png "$pkgdir/usr/share/icons/hicolor/22x22/apps/$pkgname.png"
  install -Dm644 data/$pkgname-24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/$pkgname.png"
  install -Dm644 data/$pkgname.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 data/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/labyrinth.appdata.xml "$pkgdir/usr/share/metainfo/labyrinth.appdata.xml"
}
