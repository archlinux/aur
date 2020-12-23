# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-favorites
pkgver=0.0.2
_vdrapi=2.4.6
pkgrel=18
pkgdesc="Implements a favorite channels menu"
url="http://www.vdr-portal.de/board1-news/board2-vdr-news/p1039565-announce-vdr-favorites-0-0-2/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tgz::https://www.vdr-portal.de/index.php?attachment/29502"
        "$pkgname-new-makefile.patch"
        "$pkgname-vdr-2.3.1.patch"
)
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('ed01256fbbb34e3aab28223fc51b078a08fbe46c36b582f3a807c34e65360654'
            '3fb61d2b9cee6bc79898b1cc6274ae096de928e09970cb501892520557b4102a'
            'b4920fbbd9abf6129212b8287a3308d6438418a188c86784d7e3abdc6a687e23')

# SSL certificate on www.vdr-portal.de is regularly broken so don't check it
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 --insecure -o %o %u')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "${srcdir}/$pkgname-new-makefile.patch"
  patch -p1 -i "${srcdir}/$pkgname-vdr-2.3.1.patch"
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
