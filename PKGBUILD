# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Ruslan Nabioullin <rnabioullin at gmail dot com>
# Contributor: Gordon JC Pearce <gordon at gjcp dot net>
pkgname=xastir
pkgver=2.0.8
gitver=208
pkgrel=2
pkgdesc="Full featured APRS Tracking/Information Reporting System"
url="http://www.xastir.org/"
license=('GPL' 'LGPL')
source=(https://github.com/Xastir/$pkgname/archive/$pkgname$gitver.tar.gz
        https://github.com/Xastir/$pkgname-sounds/archive/v1.0.tar.gz
        $pkgname.desktop
        $pkgname-festival.desktop
        $pkgname-speech
        $pkgname.png)
md5sums=('0e2fa97164f430b2c37a4006750207ae'
         'c314946788a828d42d804670ad23e646'
         '2a06e041a0dc5f20c1427a130613d793'
         '2f8af994b7f5086d4ca2d951ced9019a'
         'e56e55a1c43038d4488fbdd429a0a755'
         '0a7269113052d3bd2711b84ff2fda9d6')
sha512sums=('bfc5248e0f04ea6be8fe54527714490700538a73722b9d545e01e33cc5f75124044f5bf76f17d054f61fee7ac624360852c087a113414f66bf02505ef40b2291'
            '77f55f40ba9bd818e10488feb462c5fc97cab90295774a0c6b1344c6e95ac3ef215a26ba461132c4c59f857ce3a301b17e8bc3bb6fea8451327b1e8debf12f71'
            'f3d4b611dad7c14feb0b3bc46110a6c3e74da12e69d8acdbcb987eeaaec6f2a015b316cc58340f3c0b188e885d8716631d5943cdbb6ac4e8e6c1790013c540db'
            '1fa98400ab344d206b714ae45bc51b82d8a8395b3a4a39878b099176571a53cc91a4fcb0a1f011a631aea2c5c4a030e2346c537dc8d934a01382c85dd130adc5'
            'f284ce0544dd6517fbdf1d0f54d7e67f73f6eb0928bf2bd525db2aa0b0f13f61451fe7e669542730a9b77bbc6b2bf679b076fd632584684d433939f21d824ed3'
            'bc4f634825b577baf763f84441f27502480bec7020f84c98c9da1d961014d41d554d1d38d1ac29543ecb71f2f1a88f34f75d895e609bad1ec77a3670f3639874')
arch=('i686' 'x86_64')
depends=('python' 'desktop-file-utils' 'lesstif' 'shapelib' 'curl' 'libax25' 'libxml2' 'libpng' 'gdal'
    'graphicsmagick')
makedepends=('autoconf' 'automake')
conflicts=('xastir-cvs')

build() {
  cd $srcdir/Xastir-$pkgname$gitver
  ./bootstrap.sh
  ./configure --prefix=/usr
  
  sed -i -e s:doc/xastir:xastir/doc: Makefile
  
  make
}

package() {
  cd $srcdir/Xastir-$pkgname$gitver
  make DESTDIR=$pkgdir install

  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  cd $srcdir
  install -m644 *.desktop $pkgdir/usr/share/applications/
  install -m644 *.png $pkgdir/usr/share/pixmaps/
  install -m755 $pkgname-speech $pkgdir/usr/bin/
  rm $pkgdir/usr/share/$pkgname/sounds/*
  install -m644 $srcdir/$pkgname-sounds-1.0/sounds/* $pkgdir/usr/share/$pkgname/sounds/
  
  chmod 4755 $pkgdir/usr/bin/$pkgname
}
