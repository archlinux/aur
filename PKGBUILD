# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
# XXX  Currently, it is assumed that the user intends to only
#      use snmptt in standalone-mode, meaning that it is not
#      intended to run as a daemon. As such, additional config
#      and example files have been omitted. Please check the
#      docs on what additional setup is needed.

pkgname=snmptt
pkgver=1.5
pkgrel=1
pkgdesc="A Perl-based SNMP trap handler for use with the Net-SNMP / UCD-SNMP snmptrapd program"
arch=('any')
url="http://snmptt.sourceforge.net/"
license=('GPL')
depends=('bash' 'perl>=5.6.1' 'net-snmp' 'perl-config-inifiles')
optdepends=(
  'perl-dbd-mysql: To add support for MySQL database'
  'perl-dbd-pg: To add support for PostGres database'
  'perl-dbd-odbc: To add support for ODBC driver'
)
install="${pkgname}.install"
source=("https://sourceforge.net/projects/${pkgname}/files/snmptt/${pkgname}_${pkgver}/${pkgname}_${pkgver}.tgz"
        'snmptt.sysusers'
        'snmptt.tmpfiles'
        'snmptt.service')
sha256sums=('91fb6146a08c0d143e4193f1fffdb697f769f75666d72a73eeb78c013b8a227f'
            'f761511c33355bc2e4b760bcf85745f069846ec1acd3b6d5fa3756bc2accdca2'
            'cafe8ccff31e03e820db7a7c861f0f068911f88c6e270f4e264939c6e59ea029'
            'bb8ee914fbecb01c68e8cd8a0f497abefec6598164df0e4c7f1df98955e86437')

prepare () {
  cd "${srcdir}/${pkgname}_${pkgver}"

  # modify INI PID setting to new path
  sed -i 's/var\/run/run/' snmptt.ini
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  # install binaries
  install -Dm755 snmptt "$pkgdir/usr/bin/snmptt"
  install -Dm755 snmpttconvert "$pkgdir/usr/bin/snmpttconvert"
  install -Dm755 snmpttconvertmib "$pkgdir/usr/bin/snmpttconvertmib"
  install -Dm755 snmptthandler "$pkgdir/usr/bin/snmptthandler"

  # install config
  install -d "$pkgdir/etc/snmp"
  install -Dm644 snmptt.ini "$pkgdir/etc/snmp/snmptt.ini"
  install -Dm644 examples/snmptt.conf.generic "$pkgdir/etc/snmp/snmptt.conf"

  # logrotation
  install -d "$pkgdir/etc/logrotate.d"
  install -Dm644 snmptt.logrotate "$pkgdir/etc/logrotate.d/snmptt"

  # systemd service
  install -d "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/snmptt.service" "$pkgdir/usr/lib/systemd/system/snmptt.service"
  install -d "$pkgdir/usr/lib/sysusers.d"
  install -Dm644 "$srcdir/snmptt.sysusers" "$pkgdir/usr/lib/sysusers.d/snmptt.conf"
  install -d "$pkgdir/usr/lib/tmpfiles.d"
  install -Dm644 "$srcdir/snmptt.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/snmptt.conf"

  # install docs
  install -d "$pkgdir/usr/share/doc/snmptt"
  install -Dm644 README "$pkgdir/usr/share/doc/snmptt"
  cp -r docs "$pkgdir/usr/share/doc/snmptt"
  cp -r examples "$pkgdir/usr/share/doc/snmptt"
  cp -r contrib "$pkgdir/usr/share/doc/snmptt"
}

# vim:ts=2:sw=2
