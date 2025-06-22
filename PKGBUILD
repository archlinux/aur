# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Alexander Grothe <seahawk1986[at]hotmail[dot]com>
pkgname=vdr-restfulapi
epoch=1
pkgver=0.2.6.6
pkgrel=8
_vdrapi=8
pkgdesc="Restful-API Control for VDR"
url="https://github.com/yavdr/vdr-plugin-restfulapi"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('cxxtools' 'graphicsmagick' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/yavdr/vdr-plugin-$_plugname/archive/$pkgver.tar.gz"
        "${pkgname}-fix-build-with-vdr-2.7.1.patch::https://github.com/yavdr/vdr-plugin-restfulapi/commit/80d03486ef77ec9ce0d615225f8d356b72afd78e.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/restfulapi/API.html'
        'var/lib/vdr/plugins/restfulapi/osd.css'
        'var/lib/vdr/plugins/restfulapi/osd.js')
md5sums=('0ebe227bd662532dfe785452b5a325ba'
         '6e1321aea1fb5c0da8c8f863ac713b3b'
         '7b482249828a58f1f6ce2cd4a577f773')

prepare() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  patch -p1 -i "${srcdir}/${pkgname}-fix-build-with-vdr-2.7.1.patch"
  sed -i 's/Magick++/GraphicsMagick++/g' Makefile
  sed -i -e 's/var\/lib\/video\.00/srv\/vdr\/video/' tools.cpp
}

build() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -m 644 web/osd.js     "$pkgdir/var/lib/vdr/plugins/restfulapi/"
  install -m 644 web/osd.css    "$pkgdir/var/lib/vdr/plugins/restfulapi/"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
