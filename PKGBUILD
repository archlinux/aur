# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Alexander Grothe <seahawk1986[at]hotmail[dot]com>
pkgname=vdr-restfulapi
epoch=1
pkgver=0.2.6.5
pkgrel=1
_vdrapi=2.4.0
pkgdesc="Restful-API Control for VDR"
url="https://github.com/yavdr/vdr-plugin-restfulapi"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('cxxtools' 'graphicsmagick' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://github.com/yavdr/vdr-plugin-$_plugname/archive/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/restfulapi/API.html'
        'var/lib/vdr/plugins/restfulapi/osd.css'
        'var/lib/vdr/plugins/restfulapi/osd.js')
md5sums=('66da21ec918886135120b1d8bb8094e2'
         '7b482249828a58f1f6ce2cd4a577f773')

prepare() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
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
