# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinflat
pkgver=0.1.1
_vdrapi=2.6.3
pkgrel=30
pkgdesc="Simple and slim skin for VDR"
url="https://github.com/vdr-projects/vdr-plugin-skinflat"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-skinflat/archive/refs/tags/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('ef0881dc341c2d2de6a784cf0dc8cbbe88a4ea33ef4921928646d847b8789e1a'
            'fddf7ea4e1d84a9f6797fc8a9b4d8df129afd2b49d3f5c23874dde4aa752d8d8')

prepare() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  sed -i 's/Magick++/GraphicsMagick++/g' Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
