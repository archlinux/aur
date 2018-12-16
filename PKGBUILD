# Maintainer: Ed Brindley <linux@maidavale.org>

_pkgbase=asus-wmi-sensors
pkgname=asus-wmi-sensors-dkms-git
pkgver=6.04e5cc0
pkgrel=1
pkgdesc="Linux sensors driver for ASUS motherboards with WMI sensors interface"
arch=('x86_64' 'i686')
url="https://github.com/electrified/asus-wmi-sensors"
license=('GPL')
depends=('dkms')
provides=('asus-wmi-sensors')

source=("$_pkgbase::git+https://github.com/electrified/asus-wmi-sensors.git"
"asus-wmi-sensors.conf"
"dkms.conf"
"module-load.conf"
)

sha256sums=('SKIP'
'16620f044ef6dd20d0d56c4fa2c0fdd62326ea41ca2332ac9fa46aed451ced7e'
'89b3c073df8fd641e64c88d00e396ebadd2ef9c7ba35fd88cc5142d7173731ec'
'322596bc74aaecbbd6a10f6d5f2e205ff423dc512f80d5046c1ffb48057c8d62'
)

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
}

package() {
  cd "$srcdir/$_pkgbase"

  install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp -r ${srcdir}/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  install -Dm644 ${srcdir}/asus-wmi-sensors.conf "${pkgdir}"/usr/lib/depmod.d/asus-wmi-sensors.conf

  install -Dm644 ${srcdir}/module-load.conf "${pkgdir}"/etc/modules-load.d/asus-wmi-sensors.conf
}
