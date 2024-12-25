# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-scraper2vdr
pkgver=1.1.2
_vdrapi=5
pkgrel=5
pkgdesc="Acts as client and provides scraped metadata for tvshows and movies from epgd"
url='https://github.com/horchi/scraper2vdr'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' 'libmariadbclient' "vdr-api=${_vdrapi}")
makedepends=('imlib2')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/horchi/$_plugname/archive/$pkgver.tar.gz"
        "${pkgname}-vdr-2.7.1-compat.patch::https://github.com/user-attachments/files/17193394/GetEvent.txt"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/$_plugname/epg.dat")
sha256sums=('39fa6938b09d31acd9dcd7db9b0b06408c1417a064fb253ecd3c12f5293bf4ef'
            '654cf56b5fafcb64262ffb3ebb8970d449299499283c3748df99b6f59fb1c4b6'
            '21ef2037dd4b746e7eafe4314d4a27c89300916bb9fa95ff759396228004bf36')

prepare() {
  cd "${srcdir}/$_plugname-$pkgver"
  patch -p1 -i "${srcdir}/${pkgname}-vdr-2.7.1-compat.patch"
}

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
