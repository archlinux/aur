# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-remote
pkgver=0.6.0
_vdrapi=2.2.0
pkgrel=1
pkgdesc="Extends the remote control capabilities of vdr"
url="http://www.escape-edv.de/endriss/vdr/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://www.escape-edv.de/endriss/vdr/${pkgname}-${pkgver}.tgz"
        'av7110_ir_vdr_perms.conf'
        '70-remote-device.rules'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('5c6e60e9a4a0d42ca2b93f3342452202'
         'bc604e2dff886fb683048590fc5f63c8'
         '3e5fa190135b128a575dd90b14c4433a'
         '6b163c3d23df45423652f5559f8c6a61')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 ${srcdir}/70-remote-device.rules "$pkgdir/usr/lib/udev/rules.d/70-remote-device.rules"
  install -Dm644 ${srcdir}/av7110_ir_vdr_perms.conf "$pkgdir/usr/lib/modprobe.d/av7110_ir_vdr_perms.conf"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
