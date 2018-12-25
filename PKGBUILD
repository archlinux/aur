# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-cecremote
pkgver=1.4.0
_vdrapi=2.4.0
pkgrel=2
pkgdesc="Receive and send commands via CEC"
url="http://uli-eckhardt.de/vdr"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libcec' 'pugixml' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://www.uli-eckhardt.de/vdr/download/${pkgname}-${pkgver}.tgz"
        "1.4.0-libcec4-fix.patch::https://git.uli-eckhardt.de/?p=vdr-plugin-cecremote.git;a=patch;h=c5edc353295d4b2ce3578c72d9093122e283e7c1"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('79da34a720106604415b923a2f6d311e'
         'a6cd3798a575073ca71a3df78ecb7244'
         'b07791e9ca361d41d58f2017fdcec70b')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/1.4.0-libcec4-fix.patch"
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  chown -R 666:666 "$pkgdir/var/lib/vdr"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
