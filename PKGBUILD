# Maintainer: Jan Hicken <firstname [dot] lastname [at] posteo [dot] de>
# Former maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=fhem
pkgver=5.7
pkgrel=1
pkgdesc="A perl server for house automation"
arch=('any')
url='http://fhem.de'
license=('GPL')
depends=('perl' 'perl-io-socket-ssl' 'perl-json' 'perl-libwww' 'perl-xml-simple' 'perl-xml-libxml')
optdepends=('perl-device-serialport: Communication through serial port'
            'perl-net-telnet: Telnet support'
            'perl-net-snmp: SNMP support')
backup=('etc/fhem.cfg')
install="${pkgname}.install"
source=(
  "http://fhem.de/${pkgname}-${pkgver}.tar.gz"
  'fhem.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
sha256sums=('179fd251edb0bc7dbd775d7d6597fcfe7df88c2f7b39c5bbecf17defaa6b9539'
            '7adaffd1036198c8f942a7cbcdc187ba59557eccdfcd19aa28ed5f578810ce14'
            '564796d24351c6c1ebeb5995551ec670170b1c451b5efa12ea77f764f1ee7202'
            '216cbb566c38b893f7036e8e32997a3595c1cf618688be00371d9d49f715a2bd')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Fix path setup in Makefile
  sed -i 's|^RELATIVE_PATH=YES|RELATIVE_PATH=NO|' Makefile
  sed -i 's|^BINDIR=.*|BINDIR=/usr/bin|' Makefile
  sed -i 's|^MODDIR=.*|MODDIR=/usr/share/fhem|' Makefile
  sed -i 's|^VARDIR=.*|VARDIR=/var/lib/fhem|' Makefile
  sed -i 's|^MANDIR=.*|MANDIR=/usr/share/man/man1|' Makefile
  sed -i 's|^ETCDIR=.*|ETCDIR=/etc|' Makefile
  sed -i 's|^DEMODIR=.*|DEMODIR=/usr/share/fhem|' Makefile
}

package() {
  install -Dm 0644 fhem.service "${pkgdir}/usr/lib/systemd/system/fhem.service"
  install -Dm 0644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 0644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  cd "${pkgname}-${pkgver}"
  make ROOT="${pkgdir}" install

  # Remove unnecessary stuff
  rm -r "${pkgdir}/usr/share/fhem/contrib/DEBIAN"
  rm -r "${pkgdir}/usr/share/fhem/contrib/FB7270"
  rm -r "${pkgdir}/usr/share/fhem/contrib/FB7390"
  rm -r "${pkgdir}/usr/share/fhem/contrib/init-scripts"
  rm -r "${pkgdir}/usr/share/fhem/contrib/lcd4linux"
  rm -r "${pkgdir}/usr/share/fhem/contrib/PRESENCE/deb"
  rm -r "${pkgdir}/usr/share/fhem/contrib/RaspberryPi"
  rm -r "${pkgdir}/usr/share/fhem/contrib/Synology"
  rmdir --ignore-fail-on-non-empty --parents "${pkgdir}/var/lib/fhem"
}
