# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-systeminfo
pkgver=0.1.5
_vdrapi=2.6.3
pkgrel=2
pkgdesc="displays system informations like CPU type and speed, disk and swap space etc."
url='https://github.com/FireFlyVDR/vdr-plugin-systeminfo'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('iproute2' 'lm_sensors' 'hddtemp' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-${_plugname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'systeminfo.sh')
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "usr/lib/vdr/bin/$_plugname.sh")
md5sums=('308e98d2ad2ccd624bebce79a430f123'
         'ea31a11d19b78f30f389793ebc34c3cb')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  sed -i 's,usr/local,usr/lib/vdr,g' 50-systeminfo.conf systeminfo.c
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm755 ${srcdir}/systeminfo.sh "$pkgdir/usr/lib/vdr/bin/systeminfo.sh"

  install -Dm644 "50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
