# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-scraper2vdr
pkgver=1.0.9
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Acts as client and provides scraped metadata for tvshows and movies from epgd"
url="http://projects.vdr-developer.org/projects/plg-scraper2vdr"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' 'libmariadbclient' "vdr-api=${_vdrapi}")
makedepends=('imlib2')
_plugname=${pkgname//vdr-/}
source=("https://github.com/horchi/$_plugname/archive/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/$_plugname/epg.dat")
md5sums=('e62aa7701cc9ee0d6ab537573b6a5dd8'
         'b3be8ea56e120b1b0e61d9f53cd9dc26')

build() {
  cd "${srcdir}/$_plugname-$pkgver"
  make IMAGELIB=graphicsmagick
}

package() {
  cd "${srcdir}/$_plugname-$pkgver"
  make DESTDIR="$pkgdir" IMAGELIB=graphicsmagick install

  chown -R 666:666 "$pkgdir/var/lib/vdr"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
