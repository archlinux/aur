# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vompserver
pkgver=0.5.1
pkgrel=5
_vdrapi=8
pkgdesc="Server side of VOMP"
url="https://www.loggytronic.com/vomp.php"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://www.loggytronic.com/dl/$pkgname-$pkgver.tgz"
        "${pkgname}-vdr-2.7.1-compat.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/vompserver/vomp.conf')
sha256sums=('f590633d40313891d696556b6677dfb44ca6858f4e7ef8249075683d7844eecd'
            'd29c1e1ddb8bdc76b111ba5446bb59c380eb6ce8d700a863dd0ff07772d3837a'
            '1eabd9437925f60514edacb598a036adc844867e7bdb7be3c79ca8d707ed84dd')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "${srcdir}/${pkgname}-vdr-2.7.1-compat.patch"
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
