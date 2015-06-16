# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-wirbelscan
pkgver=0.0.9
_vdrapi=2.2.0
pkgrel=6
pkgdesc="Performs a channel scans for DVB-T, DVB-C and DVB-S"
url="http://wirbel.htpc-forum.de/wirbelscan/index2.html"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://wirbel.htpc-forum.de/$_plugname/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('5536179eab190edeaf71078dfae576dd'
         'cb2ff89d8c275d790cf613d4cf9fa180')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  sed -i '/Make.global/d' Makefile
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make CFLAGS="$(pkg-config vdr --variable=cflags)" \
       CXXFLAGS="$(pkg-config vdr --variable=cxxflags)" \
       VDRDIR="/usr/include/vdr" \
       LIBDIR="$pkgdir/$(pkg-config vdr --variable=libdir)" \
       LOCALEDIR="$pkgdir/$(pkg-config vdr --variable=locdir)" \
       all

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
