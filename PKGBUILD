pkgname=otrs
pkgver=4.0.7
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
            "apache:   A high performance Unix-based HTTP server"
            "mod_perl: Apache module that embeds the Perl interpreter within the server")
backup=("etc/webapps/${pkgname}/Config.pm"
        "etc/webapps/${pkgname}/GenericAgent.pm"
        "etc/webapps/${pkgname}/scheduler_watchdog")
install="${pkgname}.install"
source=("${pkgname}.install"
        "http://ftp.otrs.org/pub/otrs/${pkgname}-${pkgver}.tar.gz")
md5sums=("e505e3d39240f04185888fa674a0feb2"
         "aa61aad8ba7eae7f3f28b4fc460be1d6")
sha1sums=("e141800b7ff0c6130d4bb36063ec4ab824d2ca4c"
          "4edbdfb1d2d5731f57a2217735b83d0c302f6343")

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
