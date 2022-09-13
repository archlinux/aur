# Maintainer: Joe Pfeiffer joepfeiffer16 at gmail dot com
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=dell-command-configure
_pkgver=4.7.0-433
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Configure various BIOS features on Dell laptops'
arch=('x86_64')
url='https://www.dell.com/support/kbdoc/000178000/dell-command-configure'
license=('unknown')
depends=('bash' 'libsmbios' 'openssl' 'pciutils')
provides=('libdchtvm.so=9' 'libdchipm.so=9' 'libdchesm.so=9' 'libdchcfl.so=9'
          'libdchbas.so=9' 'libdchapi.so=9' 'libsmbios_c.so=2' 'libhapiintf.so'
          'srvadmin-hapi')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${pkgname}-${pkgver}.tar.gz::https://dl.dell.com/FOLDER08385603M/1/command-configure_${_pkgver}.ubuntu20_amd64.tar.gz")
sha256sums=('8c07db9dd7a0e1f450bd58c1649ef654f3afc2cc5b28ba2b2fbdcb243bb4738b')

prepare() {
  ar xf srvadmin-hapi_*.deb
  mkdir -p srvadmin
  bsdtar -xvf data.tar.xz -C srvadmin

  ar xf command-configure_*.deb
  mkdir -p command-configure
  bsdtar -xvf data.tar.xz -C command-configure
}

package() {
  cp -a srvadmin/* "${pkgdir}"
  cp -a command-configure/* "${pkgdir}"

  ln -Tsf omreg.d/omreg-hapi.cfg "${pkgdir}/opt/dell/srvadmin/etc/omreg.cfg"

  install -d "${pkgdir}/usr/bin"
  ln -Tsf /opt/dell/dcc/cctk "${pkgdir}/usr/bin/cctk"
}
