# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vompserver
pkgver=0.4.1
_vdrapi=2.2.0
pkgrel=12
pkgdesc="Server side of VOMP"
url="http://www.loggytronic.com/vomp.php"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://www.loggytronic.com/dl/$pkgname-$pkgver.tgz"
        'vompserver-large_recordings_fix.diff'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/vompserver/vomp.conf')
md5sums=('98861d63a54911c96a0305391c74ad2b'
         '158aa8984d267571cb39cba2ceccaeb4'
         '155bb12f84f5f76ddd1dacd5327a607f')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i ../vompserver-large_recordings_fix.diff
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm 644 vomp.conf.sample "$pkgdir/var/lib/vdr/plugins/vompserver/vomp.conf"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
