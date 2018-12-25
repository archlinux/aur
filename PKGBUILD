# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-externalplayer
pkgver=0.3.2
_vdrapi=2.4.0
pkgrel=18
pkgdesc="use external players in VDR"
url="http://www.uli-eckhardt.de/vdr/external.en.shtml"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
backup=('var/lib/vdr/plugins/externalplayer.conf')
_plugname=${pkgname//vdr-/}
source=("https://www.uli-eckhardt.de/vdr/download/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf"
        'externalplayer-fix-operator-mismatch.diff')
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/$_plugname.conf")
md5sums=('fe51ca255507db0ea4d4bc45ee43aee9'
         '4e40f42e1d1f54ea98dc8004fe79033f'
         '1d9b87cd833d24d0a5b415779288934b')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -i "$srcdir/externalplayer-fix-operator-mismatch.diff"
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}
package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" \
       CFGDIR="/var/lib/vdr/plugins/" \
       install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
