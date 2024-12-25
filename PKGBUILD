# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-fritzbox
pkgver=1.5.4
_libconvppver=286a289e30417ac534c861529ae245ccb44286e5
_libfritzppver=c74fd462285ade1054784b97b6dce22d55196c01
_liblogppver=d61e25f4548f40261e6db62a967776cfa16e599a
_libnetppver=b32ecc8e64508f3b1158a2adcbd82034c71d7a38
_vdrapi=5
pkgrel=5
pkgdesc="Connects to the Fritz!Box to inform you about incoming and outgoing calls"
url="https://github.com/jowi24/vdr-fritz"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('boost-libs>=1.57.0' 'libgcrypt' "vdr-api=${_vdrapi}")
makedepends=('boost')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/jowi24/vdr-fritz/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-libconvpp-$pkgver.tar.gz::https://github.com/jowi24/libconvpp/archive/$_libconvppver.tar.gz"
        "$pkgname-libfritzpp-$pkgver.tar.gz::https://github.com/jowi24/libfritzpp/archive/$_libfritzppver.tar.gz"
        "$pkgname-liblogpp-$pkgver.tar.gz::https://github.com/jowi24/liblogpp/archive/$_liblogppver.tar.gz"
        "$pkgname-libnetpp-$pkgver.tar.gz::https://github.com/jowi24/libnetpp/archive/$_libnetppver.tar.gz"
        "$pkgname-detach_thread.patch"
        "${pkgname}-vdr-2.7.1-compat.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('0c1568f7745457bad05368e14f83c7a1a94aa0cb2b3f607557350b0aa8a1e0b0'
            '5408184b0e516cb8feb3198c6d719f300adf62839206c26817b57506f508a9a6'
            '3aeb90212180fc29c30ff1d0fa041a43c3306ce1616b0b1fa3e04aebb5bcded4'
            '6f228b1250611b2f7f38cd143a82463486bc98d07566d4d310a4040887420269'
            '97035c688eb6fe5ea0376506fcf03f355a4853315b4276c0bc8ffb09d2ff2cea'
            '64af3529c3ea466911ee89f4848019421716a53526ee74a534ed713ccc5625ba'
            '75b5b4ede2c7f10615266bd0c57514b3c8b931940e09c9c87125c96d7f113213'
            'f80efa7827c89f30d0ce25df00e6bb0efdf0e8fe68e9ca15c7f15caea731ba33')

prepare() {
  cd "${srcdir}/vdr-fritz-${pkgver}"

  cp -r ../libconvpp-$_libconvppver/* libconv++
  cp -r ../libfritzpp-$_libfritzppver/* libfritz++
  cp -r ../liblogpp-$_liblogppver/* liblog++
  cp -r ../libnetpp-$_libnetppver/* libnet++

  patch -p1 -i "$srcdir/$pkgname-detach_thread.patch"
  patch -p1 -i "${srcdir}/${pkgname}-vdr-2.7.1-compat.patch"
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
