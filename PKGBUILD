# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-fritzbox
pkgver=1.5.7
_libconvppver=286a289e30417ac534c861529ae245ccb44286e5
_libfritzppver=0b87ad3b75614bfb12473996588cd6fa68a1b2fc
_liblogppver=d61e25f4548f40261e6db62a967776cfa16e599a
_libnetppver=81381ca4cb35a48ce56b5e8b751838b6181b6b70
pkgrel=1
_vdrapi=9
pkgdesc="Connects to the Fritz!Box to inform you about incoming and outgoing calls"
url="https://github.com/jowi24/vdr-fritz"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('boost-libs>=1.57.0' 'libgcrypt' "vdr-api=${_vdrapi}")
makedepends=('boost')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/jowi24/vdr-fritz/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname-libconvpp-$pkgver.tar.gz::https://github.com/jowi24/libconvpp/archive/$_libconvppver.tar.gz"
        "$pkgname-libfritzpp-$pkgver.tar.gz::https://github.com/jowi24/libfritzpp/archive/$_libfritzppver.tar.gz"
        "$pkgname-liblogpp-$pkgver.tar.gz::https://github.com/jowi24/liblogpp/archive/$_liblogppver.tar.gz"
        "$pkgname-libnetpp-$pkgver.tar.gz::https://github.com/jowi24/libnetpp/archive/$_libnetppver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('95715e1d5016199a5c9c30175a0c2d89a5b22c611b706177a7d1eeaab21fc393'
            '5408184b0e516cb8feb3198c6d719f300adf62839206c26817b57506f508a9a6'
            'af058ddf8be8323233be2fc85fb80cd54336e8d331bab241d5d1fc3b42033e43'
            '6f228b1250611b2f7f38cd143a82463486bc98d07566d4d310a4040887420269'
            '246d9f5482ea9400a8d468e78851c9dcd329db553a3dc6f68e4538a313d43b08'
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
