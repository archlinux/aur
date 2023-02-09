# Maintainer: Jan Hicken <firstname [dot] lastname [at] posteo [dot] de>
# Former maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=fhem
pkgver=6.2
pkgrel=1
pkgdesc="A perl server for house automation"
arch=('any')
url='https://fhem.de'
license=('GPL')
depends=('perl-io-socket-ssl' 'perl-json' 'perl-libwww' 'perl-xml-simple' 'perl-xml-libxml')
optdepends=('perl-device-serialport: Communication through serial port'
            'perl-net-telnet: Telnet support'
            'perl-net-snmp: SNMP support')
backup=('etc/fhem.cfg')
install="${pkgname}.install"
source=(
  "https://fhem.de/${pkgname}-${pkgver}.tar.gz"
  'fhem.service'
  'sysusers.conf'
  'tmpfiles.conf'
  'fix-makefile-paths.patch'
)
sha256sums=('336e1709f9c8a890526214cc3ca9713ae8664beefd2d3cd1ef784cace1469fa4'
            '7adaffd1036198c8f942a7cbcdc187ba59557eccdfcd19aa28ed5f578810ce14'
            '564796d24351c6c1ebeb5995551ec670170b1c451b5efa12ea77f764f1ee7202'
            '216cbb566c38b893f7036e8e32997a3595c1cf618688be00371d9d49f715a2bd'
            'e68b54d1a10231b625a8f23b31012b877bd3a78131423b5cbd1f0449b4a3c206')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../fix-makefile-paths.patch
}

package() {
  install -Dm 0644 fhem.service "${pkgdir}/usr/lib/systemd/system/fhem.service"
  install -Dm 0644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 0644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  cd "${pkgname}-${pkgver}"
  make ROOT="${pkgdir}" install

  chmod 0775 "${pkgdir}/usr/share/fhem"

  # Remove unnecessary stuff
  rm --recursive \
    "${pkgdir}/usr/share/fhem/contrib/DEBIAN" \
    "${pkgdir}/usr/share/fhem/contrib/FB7270" \
    "${pkgdir}/usr/share/fhem/contrib/FB7390" \
    "${pkgdir}/usr/share/fhem/contrib/init-scripts" \
    "${pkgdir}/usr/share/fhem/contrib/lcd4linux" \
    "${pkgdir}/usr/share/fhem/contrib/PRESENCE/deb" \
    "${pkgdir}/usr/share/fhem/contrib/RaspberryPi" \
    "${pkgdir}/usr/share/fhem/contrib/Synology"
  rmdir --ignore-fail-on-non-empty --parents "${pkgdir}/var/lib/fhem"
}
