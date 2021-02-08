# Maintainer: Peter Jirasek <aur@dbs.sk>
pkgname=eea
pkgver=7.1.9.0
pkgrel=2
arch=('x86_64')
pkgdesc='ESET Endpoint Antivirus Business for Linux'
url='https://www.eset.com/int/business/endpoint-antivirus-linux/'
license=('unknown')
depends=(
  'gcc'
  'make'
  'perl'
  'libelf'
  'systemd-libs'
  'openssl-1.0'
)
## Works only with LTS Linux kernel (kernel above 5.8.x is not unsuported)
optdepends=(
#  'linux-headers: build modules against the Arch kernel [requires at least one set of kernel headers]'
  'linux-lts-headers: build the module against LTS Arch kernel [requires at least one set of kernel headers]'
#  'linux-hardened-headers: build modules against the HARDENED kernel [requires at least one set of kernel headers]'
#  'linux-zen-headers: build modules against the ZEN kernel [requires at least one set of kernel headers]'
)
conflicts=('esets')
install=${pkgname}.install

# https://www.eset.com/int/business/endpoint-antivirus-linux/download/
source=("https://download.eset.com/com/eset/apps/business/eea/linux/g2/latest/${pkgname}u.${arch}.bin" "${pkgname}.install")
sha256sums=(
  '59e6ad38eb3809997e2d5eb91a0195a3c321656f5e8e8c64e61a02a9ac8c922e'
  '3cf92dcc8dff5025fa43ea47aa1b325cae1907fa5ee0e304597e92993c9caf69'
)

prepare() {
  chmod +x ${pkgname}u.${arch}.bin
  sh ${pkgname}u.${arch}.bin -n -y
  rm -f ${srcdir}/../${pkgname}u.${arch}.bin
  rm -f ${pkgname}-${pkgver}-el7.${arch}.rpm
  rm -f ${pkgname}-${pkgver}-el8.${arch}.rpm
  rm -f ${pkgname}-${pkgver}-sled15.${arch}.rpm
}

package() {
  bsdtar -xf ${pkgname}-${pkgver}-ubuntu18.${arch}.deb
  bsdtar -xf data.tar.gz -C ${pkgdir}/

  chmod 0755 ${pkgdir}/opt
  chmod 0755 ${pkgdir}/var
  chmod 0755 ${pkgdir}/var/log
  chmod 0700 ${pkgdir}/var/log/eset/${pkgname}/
  chmod 0755 ${pkgdir}/var/opt
  chmod 1770 ${pkgdir}/var/opt/eset/${pkgname}/cache/
  chmod 1770 ${pkgdir}/var/opt/eset/${pkgname}/cache/data/
}
