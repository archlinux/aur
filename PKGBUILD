# Maintainer: ???
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# https://www.dell.com/support/home/en-us/drivers/DriversDetails?driverId=42VJ8
pkgname=dell-command-configure
_pkgver=5.1.0-6
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc='Configure various BIOS features on Dell laptops'
arch=('x86_64')
url='https://www.dell.com/support/kbdoc/000178000/dell-command-configure'
license=('unknown')
depends=('bash' 'libsmbios' 'openssl-1.1' 'pciutils')
provides=('libdchtvm.so=9' 'libdchipm.so=9' 'libdchesm.so=9' 'libdchcfl.so=9'
          'libdchbas.so=9' 'libdchapi.so=9' 'libsmbios_c.so=2' 'libhapiintf.so'
          'srvadmin-hapi')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${pkgname}-${pkgver}.tar.gz::https://dl.dell.com/FOLDER12705845M/1/command-configure_${_pkgver}.ubuntu24_amd64.tar.gz")
sha256sums=('30ce838e4cff56e5422c71848e2f3c5ead2f215f807ea4248cd5f3e33a853adc')

prepare() {
  ar xf srvadmin-hapi_*.deb
  mkdir -p srvadmin
  bsdtar -xvf data.tar.xz -C srvadmin

  ar xf command-configure_*.deb
  mkdir -p command-configure
  bsdtar -xvf data.tar.zst -C command-configure
}

package() {
  cp -a srvadmin/* "${pkgdir}"
  cp -a command-configure/* "${pkgdir}"
  # Remove global ld preload configurations.
  rm -r "${pkgdir}/etc/ld.so.conf.d/"

  ln -Tsf omreg.d/omreg-hapi.cfg "${pkgdir}/opt/dell/srvadmin/etc/omreg.cfg"

  install -d "${pkgdir}/usr/bin"
  ln -Tsf /opt/dell/dcc/cctk "${pkgdir}/usr/bin/cctk"
}
