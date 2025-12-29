# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Alexander Grothe <seahawk1986[at]hotmail[dot]com>
pkgname=vdr-restfulapi
pkgver=0.2.6.8
pkgrel=1
epoch=1
_vdrapi=9
pkgdesc="Restful-API Control for VDR"
url="https://github.com/yavdr/vdr-plugin-restfulapi"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('cxxtools' 'graphicsmagick' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/yavdr/vdr-plugin-$_plugname/archive/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/restfulapi/API.html'
        'var/lib/vdr/plugins/restfulapi/osd.css'
        'var/lib/vdr/plugins/restfulapi/osd.js')
sha256sums=('b90dd204daf96125e65a2216ab98eaf3ccf8c23978e8967bcc20c287ca3bc4a8'
            '93e1bba28d7c18499327f69e7751ea831efde6bb760490888a68dec238b0856b')

prepare() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  sed -i 's/Magick++/GraphicsMagick++/g' Makefile
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
