pkgname=vtigercrm
pkgver=5.4.0
pkgrel=1
pkgdesc="A free, full-featured, 100% Open Source CRM software ideal for small and medium businesses"
arch=("any")
url="https://www.vtiger.com/crm/open-source/"
license=("custom")
depends=("mariadb>=5.5"
         "php>=5.4"
         "php-gd"
         "gd"
         "perl"
         "perl-archive-zip"
         "libpng"
         "libjpeg"
         "freetype2"
         "zlib")
backup=("etc/webapps/${pkgname}/config.php"
        "etc/webapps/${pkgname}/config.db.php"
        "etc/webapps/${pkgname}/config.inc.php"
        "etc/webapps/${pkgname}/config.template.php"
        "etc/webapps/${pkgname}/config.help.link.php"
        "etc/webapps/${pkgname}/config.performance.php"
        "etc/webapps/${pkgname}/connection.php")
options=("!strip")
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "PHPv54-v2.patch")
  
prepare() {
  cd "${srcdir}/${pkgname}/"
  patch -p1 < $srcdir/PHPv54-v2.patch
}

package() {
  install -dm 0755                                    "${pkgdir}/etc/webapps/${pkgname}/"
  install -dm 0755                                    "${pkgdir}/usr/share/webapps/${pkgname}"
  install -Dm 0644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  cp      -ra      "${srcdir}/${pkgname}/"            "${pkgdir}/usr/share/webapps/"

  for _CFGFILE in {config,config.db,config.inc,config.template,config.help.link,config.performance,connection}.php
  do
    mv    "${pkgdir}/usr/share/webapps/${pkgname}/${_CFGFILE}" "${pkgdir}/etc/webapps/${pkgname}/${_CFGFILE}"
    ln -s "/etc/webapps/${pkgname}/${_CFGFILE}"                "${pkgdir}/usr/share/webapps/${pkgname}/${_CFGFILE}"
  done

  find "${pkgdir}/usr/share/webapps/${pkgname}" \
       "${pkgdir}/etc/webapps/${pkgname}"         -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/share/webapps/${pkgname}" \
       "${pkgdir}/etc/webapps/${pkgname}"         -type d -exec chmod 755 {} \;

  chown -R 33:33 "${pkgdir}/usr/share/webapps/${pkgname}"
  chown -R 33:33 "${pkgdir}/etc/webapps/${pkgname}"
}

md5sums=('4d9fb047c42a8231bcbbad9c5e31292e'
         'dea518ebc093ff67f9fdc70caad969b9')
