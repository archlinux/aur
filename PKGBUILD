pkgname=otrs
pkgver=4.0.12
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
         "perl-crypt-eksblowfish")
optdepends=("mariadb:  Fast SQL database server, drop-in replacement for MySQL"
            "apache:   A high performance Unix-based HTTP server")
backup=("etc/webapps/${pkgname}/Config.pm"
        "etc/webapps/${pkgname}/GenericAgent.pm"
        "etc/webapps/${pkgname}/scheduler_watchdog")
install="${pkgname}.install"
source=("${pkgname}.install"
        "http://ftp.otrs.org/pub/otrs/${pkgname}-${pkgver}.tar.gz")
md5sums=("9305e7a2dd41a19a10c0d9ab376965fd"
         "0fedea179dab6bcfff7755450ada8e66")
sha1sums=("d88cdb1d905aebe146cc83bcf31dec9dcff62c30"
          "ff4b53820d09123df0639554f608585e7ba53253")

package() {
  install -dm 0755 "${pkgdir}/etc/webapps/${pkgname}"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${pkgname}"

  install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/Kernel/Config.pm.dist" \
                   "${pkgdir}/etc/webapps/${pkgname}/Config.pm"
  install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/Kernel/Config/GenericAgent.pm.dist" \
                   "${pkgdir}/etc/webapps/${pkgname}/GenericAgent.pm"
  install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/var/cron/scheduler_watchdog.dist" \
                   "${pkgdir}/etc/webapps/${pkgname}/scheduler_watchdog"

  cp -ra ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/webapps/${pkgname}/

  ln -s  "/etc/webapps/${pkgname}/Config.pm"          "${pkgdir}/usr/share/webapps/${pkgname}/Kernel/Config.pm"
  ln -s  "/etc/webapps/${pkgname}/GenericAgent.pm"    "${pkgdir}/usr/share/webapps/${pkgname}/Kernel/Config/GenericAgent.pm"
  ln -s  "/etc/webapps/${pkgname}/scheduler_watchdog" "${pkgdir}/usr/share/webapps/${pkgname}/var/cron/scheduler_watchdog"

  find "${pkgdir}/usr/share/webapps/${pkgname}" -type d -exec chmod 2775 {} \;

  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/etc/webapps/${pkgname}")
  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/usr/share/webapps/${pkgname}")
}
