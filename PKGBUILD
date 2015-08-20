# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sabart Otto - Seberm <seberm[at]gmail[dot]com>

set -u
pkgname='adminer-editor'
pkgver='4.2.2'
pkgrel='1'
pkgdesc='Database data editing tool written in PHP'
arch=('any')
license=('Apache License, Version 2.0')
depends=('php')
#conflicts=('')
optdepends=('mariadb' 'apache' 'postgresql' 'sqlite' 'sqlite2')
url='http://www.adminer.org/en/editor/'
_verurl="${url}"
_versed='http://downloads.sourceforge.net/adminer/editor-\([0-9\.]\+\).php'
_veropt='l'
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/adminer/editor-${pkgver}.php")
sha256sums=('3b07a61595756703a3e443a2bae082ae7acca511940cdaf3976cb33c7b477705')

package() {
  set -u

  install -Dpm644 "${srcdir}/editor-${pkgver}.php" "${pkgdir}/usr/share/webapps/${pkgname}/index.php"

  # It's similar to phpMyAdmin
  install -Dpm644 <(cat << EOF
Alias /${pkgname} "/usr/share/webapps/${pkgname}"
<Directory "/usr/share/webapps/${pkgname}">
  AllowOverride All
  Options FollowSymlinks
    Require all granted
    php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
</Directory>
EOF
) "${pkgdir}/etc/webapps/${pkgname}/apache.example.conf"

  install -Dpm644 "${pkgdir}/etc/webapps/${pkgname}/apache.example.conf" "${pkgdir}/etc/httpd/conf/extra/httpd-${pkgname}.conf"
  #echo "Include conf/extra/httpd-${pkgname}.conf" >> ${pkgdir}/etc/httpd/conf/httpd.conf
  set +u
}
set +u
