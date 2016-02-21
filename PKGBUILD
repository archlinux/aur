pkgname=otrs
pkgver=5.0.7
pkgrel=1
pkgdesc="OTRS is the leading open-source Help Desk and IT Service Management (ITSM)"
arch=("any")
options=("emptydirs")
url="http://www.otrs.com/"
license=("GPLv3")
depends=("perl"
         "perl-dbi"
         "perl-archive-zip"
         "perl-crypt-ssleay"
         "perl-timedate"
         "perl-dbd-mysql"
         "perl-gd"
         "perl-gdtextutil"
         "perl-gdgraph"
         "perl-json-xs"
         "perl-lwp-protocol-https"
         "perl-mail-imapclient"
         "perl-net-dns"
         "perl-ldap"
         "perl-pdf-api2"
         "perl-template-toolkit"
         "perl-yaml-libyaml"
         "perl-text-csv-xs"
         "perl-xml-parser"
         "perl-xml-libxslt"
         "perl-crypt-eksblowfish")
optdepends=("mariadb:  Fast SQL database server, drop-in replacement for MySQL"
            "apache:   A high performance Unix-based HTTP server")
backup=("etc/webapps/${pkgname}/Config.pm")
install="${pkgname}.install"
source=("${pkgname}.install"
        "http://ftp.otrs.org/pub/otrs/${pkgname}-${pkgver}.tar.gz")
md5sums=("9305e7a2dd41a19a10c0d9ab376965fd"
         "cf2cbcf35f637b1283695ddd88c55057")
sha1sums=("d88cdb1d905aebe146cc83bcf31dec9dcff62c30"
          "d76bc3f235d7e91a35cdbdc7edafee5e7a66701b")

prepare() {
cat << EOL > "${srcdir}/${pkgname}-cron.service"
[Unit]
Description=OTRS Cron
After=syslog.target network.target

[Service]
User=otrs
Type=simple
ExecStart=/usr/share/webapps/otrs/bin/Cron.sh start
ExecStop=/usr/share/webapps/otrs/bin/Cron.sh stop
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOL
}

package() {
  install -dm 0755 "${pkgdir}/etc/webapps/${pkgname}"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${pkgname}"

  install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/Kernel/Config.pm.dist" "${pkgdir}/etc/webapps/${pkgname}/Config.pm"
  install -Dm 0644 "${srcdir}/${pkgname}-cron.service"                    "${pkgdir}/usr/lib/systemd/system/${pkgname}-cron.service"

  cp -ra ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/webapps/${pkgname}/

  for FILENAME in ${pkgdir}/usr/share/webapps/${pkgname}/var/cron/*.dist
  do
    mv $FILENAME ${pkgdir}/usr/share/webapps/${pkgname}/var/cron/`basename $FILENAME .dist`
  done

  ln -s  "/etc/webapps/${pkgname}/Config.pm"          "${pkgdir}/usr/share/webapps/${pkgname}/Kernel/Config.pm"

  find "${pkgdir}/usr/share/webapps/${pkgname}" -type d -exec chmod 2775 {} \;

  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/etc/webapps/${pkgname}")
  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/usr/share/webapps/${pkgname}")
}
