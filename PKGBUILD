# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-radio
pkgver=2.0.0
pkgrel=1
_vdrapi=9
pkgdesc="Display an background image while the vdr is switched to radio channels"
url='https://github.com/vdr-projects/vdr-plugin-radio'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-${_plugname}-${pkgver}.tar.gz::https://github.com/vdr-projects/vdr-plugin-${_plugname}/archive/refs/tags/${pkgver}.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('ac8c0c31fae332acd1e6ced1759a8e196b01955167b28c45d6167b740d29621a'
            'f4d789b518e9343fd554035f494157b4f8970ec653b2849260e0a442bcd8ee64')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  #Install all stillpictures
  mkdir -p "$pkgdir/usr/share/vdr/plugins/$_plugname"
  install -Dm644 config/mpegstill/* "$pkgdir/usr/share/vdr/plugins/$_plugname"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
