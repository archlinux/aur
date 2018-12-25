# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vompserver
pkgver=0.5.0
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Server side of VOMP"
url="http://www.loggytronic.com/vomp.php"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://www.loggytronic.com/dl/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/vompserver/vomp.conf')
md5sums=('20db427a8fd490efc0eadf50e549a554'
         '155bb12f84f5f76ddd1dacd5327a607f')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make CXXFLAGS="$CXXFLAGS -std=gnu++98 -fPIC"
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm 644 vomp.conf.sample "$pkgdir/var/lib/vdr/plugins/vompserver/vomp.conf"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
