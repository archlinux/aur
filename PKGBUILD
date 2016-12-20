# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Ruslan Nabioullin <rnabioullin at gmail dot com>
# Contributor: Gordon JC Pearce <gordon at gjcp dot net>
pkgname=xastir
pkgver=2.0.8
pkgrel=1
pkgdesc="Full featured APRS Tracking/Information Reporting System"
url="http://www.xastir.org/"
license=('GPL' 'LGPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        http://downloads.sourceforge.net/$pkgname/$pkgname-sounds.tgz
        $pkgname.desktop
        $pkgname-festival.desktop
        $pkgname-speech
        $pkgname.png)
md5sums=('2a1101b6cb73e18fae98c2827a0c6217'
         '4201e7079cb5b2bd8a7c34dccfa3f2bb'
         'ba0d1f9a706ec52295265f1c34edc265'
         'dc1cc50cdf5d288951d50b3e106776c0'
         'e56e55a1c43038d4488fbdd429a0a755'
         '0a7269113052d3bd2711b84ff2fda9d6')
sha512sums=('fd98a880392e9fcb049c6049ebc6a6a5e600571b7b59fd7061a72404abd68530ae6f152c9eabdc39be0458b33b363ce7fa3fdd5330003298bca8eaac62a6982f'
            'ab0f6cd74cc61f07588c0dcfb34c86537b5007f215bd832165f4fb652c4fa9e7be5ef4529b8deb4af8ab483b7ff9f5c4ac634e15abb049ede18a91ea6d88b602'
            '1893febd88b5db3a2d6cfd0615e01091f247836a66e9a3e9a4cca5a0412daf0a5e4dfd47f1308546df54ad28b11994a07903d49c62b13c0fff8f75af24f9f550'
            '2f81c3840246bed044c61cc4a56228a3d34ceeadb4411402f54a9ca63f6cfcc37258f3f49b31905237a39f55c8b9cd082ea31a04fe82de9cb35a25559902ed90'
            'f284ce0544dd6517fbdf1d0f54d7e67f73f6eb0928bf2bd525db2aa0b0f13f61451fe7e669542730a9b77bbc6b2bf679b076fd632584684d433939f21d824ed3'
            'bc4f634825b577baf763f84441f27502480bec7020f84c98c9da1d961014d41d554d1d38d1ac29543ecb71f2f1a88f34f75d895e609bad1ec77a3670f3639874')
arch=('i686' 'x86_64')
depends=('python' 'desktop-file-utils' 'lesstif' 'shapelib' 'curl' 'libax25' 'libxml2' 'libpng' 'gdal'
    'graphicsmagick')
makedepends=('autoconf' 'automake')
conflicts=('xastir-cvs')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  
  sed -i -e s:doc/xastir:xastir/doc: Makefile
  
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install

  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  cd $srcdir
  install -m644 *.desktop $pkgdir/usr/share/applications/
  install -m644 *.png $pkgdir/usr/share/pixmaps/
  install -m755 $pkgname-speech $pkgdir/usr/bin/
  rm $pkgdir/usr/share/$pkgname/sounds/*
  install -m644 sounds/* $pkgdir/usr/share/$pkgname/sounds/
  
  chmod 4755 $pkgdir/usr/bin/$pkgname
}
