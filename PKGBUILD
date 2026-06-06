# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-fritzbox
pkgver=1.5.8
_libconvppver=286a289e30417ac534c861529ae245ccb44286e5
_libfritzppver=0b87ad3b75614bfb12473996588cd6fa68a1b2fc
_liblogppver=d61e25f4548f40261e6db62a967776cfa16e599a
_libnetppver=9b5400cbed4d84dcf539791774041a3bd9c5263d
pkgrel=3
_vdrapi=13
pkgdesc="Connects to the Fritz!Box to inform you about incoming and outgoing calls"
url="https://github.com/jowi24/vdr-fritz"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPL2')
depends=('boost-libs>=1.57.0' 'libgcrypt' "vdr-api=${_vdrapi}")
makedepends=('boost')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/jowi24/vdr-fritz/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-libconvpp-$pkgver.tar.gz::https://github.com/jowi24/libconvpp/archive/$_libconvppver.tar.gz"
        "$pkgname-libfritzpp-$pkgver.tar.gz::https://github.com/jowi24/libfritzpp/archive/$_libfritzppver.tar.gz"
        "$pkgname-liblogpp-$pkgver.tar.gz::https://github.com/jowi24/liblogpp/archive/$_liblogppver.tar.gz"
        "$pkgname-libnetpp-$pkgver.tar.gz::https://github.com/jowi24/libnetpp/archive/$_libnetppver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('b38fbc64f4f6e433f9d2b02267e28ace15c821d8c4034fe04af5c10cc7108d63'
            '5408184b0e516cb8feb3198c6d719f300adf62839206c26817b57506f508a9a6'
            'af058ddf8be8323233be2fc85fb80cd54336e8d331bab241d5d1fc3b42033e43'
            '6f228b1250611b2f7f38cd143a82463486bc98d07566d4d310a4040887420269'
            '964b3ab5c44c6538154428f8acedb63ee6ff463bcdb7551d03dbab413ed8598d'
            'f80efa7827c89f30d0ce25df00e6bb0efdf0e8fe68e9ca15c7f15caea731ba33')

prepare() {
  cd "${srcdir}/vdr-fritz-${pkgver}"

  cp -r ../libconvpp-$_libconvppver/* libconv++
  cp -r ../libfritzpp-$_libfritzppver/* libfritz++
  cp -r ../liblogpp-$_liblogppver/* liblog++
  cp -r ../libnetpp-$_libnetppver/* libnet++
}

build() {
  cd "${srcdir}/vdr-fritz-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-fritz-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
