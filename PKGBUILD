# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-autostart
pkgver=0.9.7
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Automatic start of other plug-ins on change or insertion of removable devices"
url="http://www.uli-eckhardt.de/vdr/autostart.en.shtml"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libcdio' 'libdbus' 'libdvdread' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
backup=("var/lib/vdr/plugins/$_plugname/cd.mpg")
source=("https://www.uli-eckhardt.de/vdr/download/${pkgname}-${pkgver}.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/$_plugname/$_plugname.conf")
md5sums=('c370f3c0dfa906b3670cfa2fcc5975ca'
         'bfac43507495484a347bf5ab6c158651')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  sed -i 's/$(DESTDIR)//g' Makefile.inc
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 contrib/$_plugname.conf "$pkgdir/var/lib/vdr/plugins/$_plugname/$_plugname.conf"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
