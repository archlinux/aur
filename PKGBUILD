# Maintainer: Peter Jirasek <aur@dbs.sk>
pkgname=eea
_pkgver_major=9
pkgver=9.0.5.0
pkgrel=1
arch=('x86_64')
pkgdesc='ESET Endpoint Antivirus Business for Linux'
url='https://www.eset.com/int/business/endpoint-antivirus-linux/'
license=('proprietary')
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
  'linux-headers: build modules against the Arch kernel [requires at least one set of kernel headers]'
  'linux-lts-headers: build the module against LTS Arch kernel [requires at least one set of kernel headers]'
  'linux-hardened-headers: build modules against the HARDENED kernel [requires at least one set of kernel headers]'
  'linux-zen-headers: build modules against the ZEN kernel [requires at least one set of kernel headers]'
)
conflicts=('esets' 'eea-dkms' 'eea7-dkms')
install=${pkgname}.install

# https://www.eset.com/int/business/endpoint-antivirus-linux/download/
source=("https://download.eset.com/com/eset/apps/business/eea/linux/g2/v${_pkgver_major}/${pkgver}/${pkgname}u.${arch}.bin" "${pkgname}.install")
sha256sums=(
  'd7682777d1cea6714ea0256bfc272217eb795139227edd60bafdf28d38a10aeb'
  'ab027704f39b684fe138182bf23d7d0d3eb556c6e5dc3751cc3b09ac97f71214'
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
