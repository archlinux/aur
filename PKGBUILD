# Maintainer: David Jurenka <arch.box NO-SP@M imx.jurenka DOT cz>
# Contributor: Danilo Kuehn <dk at nogo-software dot de>

pkgname=vaiopower
pkgver=0.5.0
pkgrel=3
pkgdesc="Tool for power management of Sony Vaio laptop devices"
arch=(any)
url="http://vaio-utils.org/power/"
license=('custom:ISC')
depends=(pciutils udev dmidecode)
optdepends=('pm-utils: restore settings on hibernate or suspend')
backup=(etc/vaiopower.conf)
install=vaiopower.install
source=(http://vaio-utils.org/download/$pkgname-$pkgver.tar.xz)
md5sums=(959fea9b89747fc25d017b3bef75da9c)
sha256sums=(3b48cbf57c635fc7e0c84dd33202984025ed09008452a5b68eb2d68216986259)

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make prefix=/usr DESTDIR=${pkgdir} copy-exec
  make prefix=/usr DESTDIR=${pkgdir} copy-conf
  make prefix=/usr UDEVDIR=/lib/udev/rules.d DESTDIR=${pkgdir} copy-udev
  make prefix=/usr DESTDIR=${pkgdir} copy-bash
  make prefix=/usr DESTDIR=${pkgdir} copy-sleep
  make prefix=/usr DESTDIR=${pkgdir} copy-man
  make prefix=/usr DESTDIR=${pkgdir} copy-doc

  # systemd script
  install -d "${pkgdir}/usr/lib/systemd/system"
  install "init-scripts/systemd/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  # license
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

