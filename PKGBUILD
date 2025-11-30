# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: ast261
pkgname=vdr-burn
pkgver=0.3.1
pkgrel=1
epoch=1
_vdrapi=2.6.1
pkgdesc="VDR plugin to create DVDs"
url='https://github.com/FireFlyVDR/vdr-plugin-burn'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gd' 'boost' 'libcdio' 'imlib2' 'dvd+rw-tools' 'dvdauthor' 'mjpegtools' 'lxdvdrip' 'projectx' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-${_plugname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('8165ccdbac816cdb073fb1eda92c15269bf9eceb7223dffb027cb7f6d48d014f')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  sed -i 's/ProjectX.jar/projectx\/ProjectX.jar/g' config/vdrburn-dvd.conf
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

