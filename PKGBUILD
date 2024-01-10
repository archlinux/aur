# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-xmltv2vdr
pkgver=0.2.3
pkgrel=1
_vdrapi=2.6.5
pkgdesc="Add epg info from epg sources into vdr"
url='https://github.com/vdr-projects/vdr-plugin-xmltv2vdr'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('pcre' 'curl' 'enca' 'libxslt' 'libzip' 'sqlite' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-xmltv2vdr/archive/refs/tags/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('e543f2ce175960a6664d6c06dd3c9dc89c15599e144c0c8551efd66368293579'
            'e4026eb61fd31dd51cb33cb5d0fbf1fbfb9b36205c9c6fbe94bb9b5dc177080b')

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
