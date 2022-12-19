# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-suspendoutput
pkgver=2.1.0
_vdrapi=2.6.3
pkgrel=7
pkgdesc="Output device that does nothing"
url="http://phivdr.dyndns.org/vdr/vdr-dummydevice/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('ffmpeg')
_plugname=${pkgname//vdr-/}
source=("http://phivdr.dyndns.org/vdr/$pkgname/$pkgname-$pkgver.tgz"
        "$pkgname-nooutput.patch"
        "$pkgname-timer_fix_vdr2.4.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('3109de8b18431613b8ebd5d9a2dd8b6b730a8efd321beb2b13508ae1825c80ed'
            '23bfb82b24555fd936538cfc33d232bc8833547182d5429996abf486023ab4b6'
            '681cade0debc9c22df507a816d3137635b03243dd76f18df648a6df7d3bf7b77'
            'df5a85dd056e5dd99c723bb96ec5f822df3beed97e232a33378542e2e686d8de')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/$pkgname-nooutput.patch"
  patch -p1 -i "$srcdir/$pkgname-timer_fix_vdr2.4.patch"

  # http://www.vdr-wiki.de/wiki/index.php/Kategorie:Raspbian_VDR_Streaming_Client_mittels_Streamdev_und_rpihddevice#Installation_vorbereiten
  for i in *.mpg; do
    mv $i $i.pes
    ffmpeg -i $i.pes -f mpegts $i
  done
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
