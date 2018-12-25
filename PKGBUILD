# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-trayopenng
pkgver=1.0.2
_vdrapi=2.4.0
pkgrel=2
pkgdesc="Open or close the CD/DVD tray via the menu or via a function key of the remote control"
url="http://www.uli-eckhardt.de/vdr/trayopenng.en.shtml"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=("gcc-libs" "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://www.uli-eckhardt.de/vdr/download/${pkgname}-${pkgver}.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('ae4c69f50dd110d9d1e8775c91d36ff0'
         'bb78a9c125eeca84e7bbc7f9bd3c9081')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  sed -i 's/LOCDIR = $(DESTDIR)/LOCDIR = /g' Makefile
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make CFGDIR=$(pkg-config --variable=resdir vdr)/plugins/$_plugname DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
