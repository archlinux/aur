# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-xmltv2vdr
pkgver=0.2.2
_vdrapi=2.6.5
pkgrel=2
pkgdesc="Add epg info from epg sources into vdr"
url='https://github.com/vdr-projects/vdr-plugin-xmltv2vdr'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('pcre' 'curl' 'enca' 'libxslt' 'libzip' 'sqlite' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-xmltv2vdr/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-libxml-2_12.patch::https://github.com/vdr-projects/vdr-plugin-xmltv2vdr/commit/3892ae9ae1e7e281681d2d6f4e31a05c570e489a.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('f12a1af9b3cd5aa6eaa46b81721efa3a0495393378bd766e2449593226076e1e'
            '735d04cba2f90087a1ff28c504ae7aa83bc4ac89807b71ff962849861553a801'
            'e4026eb61fd31dd51cb33cb5d0fbf1fbfb9b36205c9c6fbe94bb9b5dc177080b')

prepare() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  patch -p1 -i "$srcdir/$pkgname-libxml-2_12.patch"
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  mkdir -p "$pkgdir/var/lib/epgsources/epgdata2xmltv-img"
  chown -R 666:666 "$pkgdir/var/lib/epgsources"

  mkdir -p "$pkgdir/var/cache/vdr/epgimages"
  chown -R 666:666 "$pkgdir/var/cache/vdr"
}
