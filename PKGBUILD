# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sabart Otto - Seberm <seberm[at]gmail[dot]com>

# TODO: The editor is stuck in the first database and won't let me into any others.

[ ! -s 'PKGBUILD.local' ] && cat > 'PKGBUILD.local' << EOF
# adminer-editor or another name for your link
_opt_WWWName='adminer-editor' # default: adminer-editor
#_opt_WWWName=''

# Supply a long hext code generated at https://www.grc.com/passwords.htm
# Your server will be at http://localhost/adminer-editor-LONGHEXCODE/
# This will make it hard to find on a public facing server.
# Save your server as a link.
_opt_HexCode='' # default: blank
#opt_HexCode=''
EOF
. 'PKGBUILD.local'

set -u
test ! -z "${_opt_HexCode}" && _opt_HexCode="-${_opt_HexCode}"

pkgname='adminer-editor'
pkgver='4.2.2'
pkgrel='1'
pkgdesc='Database data editing tool written in PHP'
arch=('any')
url='http://www.adminer.org/en/editor/'
license=('Apache License, Version 2.0')
depends=('php')
optdepends=('mariadb' 'apache' 'postgresql' 'sqlite' 'sqlite2')
_verurl="${url}"
_versed='http://downloads.sourceforge.net/adminer/editor-\([0-9\.]\+\).php'
_veropt='l'
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/adminer/editor-${pkgver}.php")
sha256sums=('3b07a61595756703a3e443a2bae082ae7acca511940cdaf3976cb33c7b477705')

package() {
  set -u

  install -Dpm644 "${srcdir}/editor-${pkgver}.php" "${pkgdir}/usr/share/webapps/${pkgname}/index.php"

  # Its similar to phpMyAdmin
  install -Dpm644 <(cat << EOF
# Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/
Alias /${_opt_WWWName}${_opt_HexCode} "/usr/share/webapps/${pkgname}"
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
