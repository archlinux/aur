# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-favorites
pkgver=0.0.2
_vdrapi=2.4.0
pkgrel=15
pkgdesc="Implements a favorite channels menu"
url="http://www.vdr-portal.de/board1-news/board2-vdr-news/p1039565-announce-vdr-favorites-0-0-2/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tgz::https://www.vdr-portal.de/index.php?attachment/29502"
        "favorites-makefile-1.7.36.tar.gz::https://www.vdr-portal.de/index.php?attachment/32856"
        "favorites-0.0.2-vdr-2.3.1-porting.diff::https://www.vdr-portal.de/index.php?attachment/38761-favorites-0-0-2-vdr-2-3-1-porting-diff/"
)
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('b5e87d11102ff1d8923a64cd53694171'
         'e3262d62bee7d4e99c16d3359e77261f'
         '8bc83fc7ac565f6d89b4bf1e2b617996')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "${srcdir}/favorites-0.0.2-vdr-2.3.1-porting.diff"
  cp "$srcdir/favorites-makefile-1.7.36" Makefile
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
