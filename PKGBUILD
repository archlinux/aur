pkgname=otrs
pkgver=6.0.15
pkgrel=1
pkgdesc="OTRS is the leading open-source Help Desk and IT Service Management (ITSM)"
arch=("any")
options=("emptydirs")
url="http://www.otrs.com/"
license=("GPLv3")
depends=("perl"
         "perl-gd"
         "perl-dbi"
         "perl-ldap"
         "perl-ntlm"
         "perl-dbd-pg"
         "perl-gdgraph"
         "perl-json-xs"
         "perl-net-dns"
         "perl-datetime"
         "perl-timedate"
         "perl-pdf-api2"
         "perl-dbd-odbc"
         "perl-dbd-mysql"
         "perl-gdtextutil"
         "perl-xml-parser"
         "perl-archive-zip"
         "perl-text-csv-xs"
         "perl-xml-libxslt"
         "perl-authen-sasl"
         "perl-crypt-ssleay"
         "perl-yaml-libyaml"
         "perl-mail-imapclient"
         "perl-template-toolkit"
         "perl-lwp-protocol-https"
         "perl-bytes-random-secure")
optdepends=("mariadb:  Fast SQL database server, drop-in replacement for MySQL"
            "apache:   A high performance Unix-based HTTP server")
backup=("etc/webapps/${pkgname}/Config.pm")
install="${pkgname}.install"
source=("${pkgname}.install"
        "http://ftp.otrs.org/pub/otrs/${pkgname}-${pkgver}.tar.gz")
sha256sums=("cb10dda941c7477880ae06362ef69fe0cfb1d06ad9ad1315cb7322d4dd65963e"
            "a0353640755e743073f46cce01b57db04f64f2b23bfba673aa2b1b5e7d6a1266")

prepare() {
cat << EOL > "${srcdir}/${pkgname}.service"
[Unit]
Description=OTRS Daemon
After=network.target

[Service]
User=otrs
Group=http
Type=simple
ExecStart=/usr/share/webapps/otrs/bin/otrs.Daemon.pl start
ExecStop=/usr/share/webapps/otrs/bin/otrs.Daemon.pl stop
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOL
}

package() {
  install -dm 0755 "${pkgdir}/etc/webapps/${pkgname}"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${pkgname}"

  install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/Kernel/Config.pm.dist" "${pkgdir}/etc/webapps/${pkgname}/Config.pm"
  install -Dm 0644 "${srcdir}/${pkgname}.service"                         "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  cp -ra ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/webapps/${pkgname}/

  for FILENAME in ${pkgdir}/usr/share/webapps/${pkgname}/var/cron/*.dist
  do
    mv $FILENAME ${pkgdir}/usr/share/webapps/${pkgname}/var/cron/`basename $FILENAME .dist`
  done

  ln -s  "/etc/webapps/${pkgname}/Config.pm" "${pkgdir}/usr/share/webapps/${pkgname}/Kernel/Config.pm"

  find "${pkgdir}/usr/share/webapps/${pkgname}" -type d -exec chmod 2775 {} \;

  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/etc/webapps/${pkgname}")
  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/usr/share/webapps/${pkgname}")
}
